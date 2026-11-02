//Simple algorithm
package main

import "core:fmt"
import "core:math"
import "core:math/rand"

//I need layers as a structure

Layer :: struct {
	
	neurons: i32,
	layer_number: i32,

}

Neuron :: struct {

	bias: f32,
	weights: []f32, /* needs to be an array or list */
	inputs: []f32, /* also need to be an array connected with weights*/
	output: f32,

}

forward :: proc(n: ^Neuron) {
    n.output = n.bias

    for i in 0..<len(n.weights) {
        n.output += n.weights[i] * n.inputs[i]
    }
}

rand_bias_array : f64
rand_weights_array : []f32

create_layer :: proc(n: ^Layer, inputs: []f32) {
	for i in 0..<n.neurons {
	

	// need an if condition to check if other hidden layers exist
	
	if n.layer_number >0 {
		for i in 0..<len(inputs){
			rand_weights_array[i] = rand.float64_range(0, 1)
			rand_bias_array[i] = rand.float64_range(0, 1)
			}
	}else {
		

	}


		i : Neuron{
			bias = rand_bias_array
			weights = rand_weights_array
			

		}

	}

}

main :: proc() {
    // Input layer: 5 input values
    inputs := []f32{0.2, 0.3, 0.7, 0.9, 0.1}

    // Hidden layer: 3 neurons, each with 5 weights
    h1 := Neuron{
        bias    = 0.7,
        weights = []f32{0.5, 0.2, 1.0, 2.0, 3.0},
        inputs  = inputs,
    }

    h2 := Neuron{
        bias    = 0.4,
        weights = []f32{0.3, 0.8, 0.5, 1.2, 0.4},
        inputs  = inputs,
    }

    h3 := Neuron{
        bias    = 0.2,
        weights = []f32{1.0, 0.4, 0.7, 0.3, 0.9},
        inputs  = inputs,
    }

    // Calculate hidden layer outputs
    forward(&h1)
    forward(&h2)
    forward(&h3)

    fmt.println("Hidden neuron 1:", h1.output)
    fmt.println("Hidden neuron 2:", h2.output)
    fmt.println("Hidden neuron 3:", h3.output)

    // Output layer: 1 neuron with 3 weights
    hidden_outputs := []f32{
        h1.output,
        h2.output,
        h3.output,
    }

    out := Neuron{
        bias    = 0.5,
        weights = []f32{0.6, 0.9, 0.2},
        inputs  = hidden_outputs,
    }

    // Calculate final output
    forward(&out)

    fmt.println("Final output:", out.output)
}

//next step is to make this infinitly expandable without calculating every neuron by itself


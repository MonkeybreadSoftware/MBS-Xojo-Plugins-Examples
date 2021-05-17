// See a quick reference for OpenCL language here: http://www.khronos.org/files/opencl-quick-reference-card.pdf

__kernel square( __global uchar* input1, const unsigned int input1Count, __global uchar* input2, const unsigned int input2Count, __global uchar* output, const unsigned int outputCount) {
	int i = get_global_id(0);
	if (i < outputCount) {
		output[i] = (input1[i] + input2[i]) * 0.5f; // Find the mean of two values
	}
}

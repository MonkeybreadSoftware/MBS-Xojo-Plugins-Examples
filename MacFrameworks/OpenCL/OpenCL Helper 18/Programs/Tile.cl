// See a quick reference for OpenCL language here: http://www.khronos.org/files/opencl-quick-reference-card.pdf

__kernel square( __global uchar* tile, const unsigned int tileCount, const unsigned int tileWidth, const unsigned int tileHeight, const unsigned int outputWidth, __global uchar* output, const unsigned int outputCount ) {
	int i = get_global_id(0);
	if (i < outputCount) {
		int y = i / outputWidth;
		int x = i - (y * outputWidth);
	
        output[i] = tile[((y % tileHeight) * tileWidth) + (x % tileWidth)];
        //output[i] = tile[i];
	}
}

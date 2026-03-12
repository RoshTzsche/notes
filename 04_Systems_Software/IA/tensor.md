# Tensor
I'm impressed how does a tensor (specifically in an image) works. 
A 4 dimension tensor has 4 parameters [Batch, Channels, Height, Width]

The second parameter of the tensor dictates how many different types of measurements exist at a single coordinate.

* Channels = 1 means there is only one measurement type: Luminance (brightness).

* Channels = 3 means there are three measurement types: Red, Green, and Blue.

Tensor geometry (channels) dictates the number of distinct spectral measurements, whereas data type (bit-depth) dictates measurement precision




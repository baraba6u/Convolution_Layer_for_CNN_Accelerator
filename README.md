# Convolution Layer for CNN Accelerator
This is my Digital Systems Design class project code for building a CNN accelerator. I designed a convolution layer of modified VGG16 architecture. My two other teammates(Park Jun Young and Cho Jae Hoon) each designed pooling layer and fully-connected layer. I only included my codes and on-board test result python files for copyright reason. We successfully built CNN accelerator for image inference as a team and reached required accuracy of 77.0% for 100 image test. The network parameters were already provided.

## Project Overview
![image](https://user-images.githubusercontent.com/26453618/147485934-f37f5cbb-1687-48a1-bde2-5f181d25f320.png)
[Source : Computer Architecture Group @ SNU ECE]

We designed CNN accelerator for modified VGG16 architecture on above image. CIFAR-10 dataset is used for image source. For convolution layer, kernel size is 3x3 and stride is 1. Zero-padding of size 1 is included to maintain the same output image width and height.
We used APB protocol for the control path and AXI VDMA for data read/write between FPGA and CPU.
The testbench I used for Vivado simulation is Input channel size=3, Ouput channel size=8, Feature length=8 dataset. VDMA sends and receives data as lines of 32bit words.
I used 1-D systolic array for convolution calculation and BRAM for storing data.

## Directory Structure
- ```src``` : Verilog source code of convolution layer
  - ```conv_apb.v``` : APB interface
  - ```conv_module.v``` : Convolution layer module
  - ```conv_top.v``` : Top module

- ```FPGA test result``` : FPGA test result (The python codes belong to Computer Architecture Group @ SNU ECE)
  - ```all_layer_test.ipynb``` : All layer test result
  - ```single_layer_test.ipynb``` : Single layer test result

- ```waveforms``` : Vivado waveforms for testbench
  - ```Main.jpg```: General overview
  - ```Systolic Array.jpg```: Systolic array calculation waveform
  - ```Tcl result.jpg```: Test bench passed
  - ```Weight input.jpg```: Weight input waveform
- ```FSM diagram.jpg``` : FSM for convolution layer

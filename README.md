# Dynamic length color palettes
![figure](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/8ee132c2-745c-4063-addf-c8e8a290d875/7bcf8a09-2420-4ad2-a32e-863a7b4bba9f/images/screenshot.jpg)

### Quick start
Change `imgname` to your input image name in `demo.m`, then run. 
There are two versions of our method implemented in `getBestCP` and `getBestCP_`. You can test them by changing line 10 in `demo.m` (`[K, C, Labels] = getBestCP(I, 0);` or `[K, C, Labels] = getBestCP_(I, 0);`).

You can test our online demo from [here](http://130.63.97.192/DynamicCP/demo.php).

Publication: 
Mahmoud Afifi, "Dynamic length colour palettes.", Electronics Letters (2019).

[![View Dynamic length color palettes on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/71720-dynamic-length-color-palettes)



### Related Research Projects
- sRGB Image White Balancing:
  - [When Color Constancy Goes Wrong](https://github.com/mahmoudnafifi/WB_sRGB): The first work for white-balancing camera-rendered sRGB images (CVPR 2019).
  - [White-Balance Augmenter](https://github.com/mahmoudnafifi/WB_color_augmenter): Emulating white-balance effects for color augmentation; it improves the accuracy of image classification and image semantic segmentation methods (ICCV 2019).
  - [Color Temperature Tuning](https://github.com/mahmoudnafifi/ColorTempTuning): A camera pipeline that allows accurate post-capture white-balance editing (CIC best paper award, 2019).
  - [Interactive White Balancing](https://github.com/mahmoudnafifi/Interactive_WB_correction): Interactive sRGB image white balancing using polynomial correction mapping (CIC 2020).
  - [Deep White-Balance Editing](https://github.com/mahmoudnafifi/Deep_White_Balance): A multi-task deep learning model for post-capture white-balance editing (CVPR 2020).
- Raw Image White Balancing:
  - [APAP Bias Correction](https://github.com/mahmoudnafifi/APAP-bias-correction-for-illumination-estimation-methods): A locally adaptive bias correction technique for illuminant estimation (JOSA A 2019).
  - [SIIE](https://github.com/mahmoudnafifi/SIIE): A sensor-independent deep learning framework for illumination estimation (BMVC 2019).
  - [C5](https://github.com/mahmoudnafifi/C5): A self-calibration method for cross-camera illuminant estimation (arXiv 2020).
- Image Enhancement:
  - [CIE XYZ Net](https://github.com/mahmoudnafifi/CIE_XYZ_NET): Image linearization for low-level computer vision tasks; e.g., denoising, deblurring, and image enhancement (arXiv 2020).
  - [Exposure Correction](https://github.com/mahmoudnafifi/Exposure_Correction): A coarse-to-fine deep learning model with adversarial training to correct badly-exposed photographs (CVPR 2021).
 - Image Manipulation:
    - [MPB](https://github.com/mahmoudnafifi/modified-Poisson-image-editing): Image blending using a two-stage Poisson blending (CVM 2016).
    - [Image Recoloring](https://github.com/mahmoudnafifi/Image_recoloring): A fully automated image recoloring with no target/reference images (Eurographics 2019).
    - [Image Relighting](https://github.com/mahmoudnafifi/image_relighting): Relighting using a uniformly-lit white-balanced version of input images (Runner-Up Award overall tracks of AIM 2020 challenge for image relighting, ECCV 2020). 
    - [HistoGAN](https://github.com/mahmoudnafifi/HistoGAN): Controlling colors of GAN-generated images based on features derived directly from color histograms (CVPR 2021). 

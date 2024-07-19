# load plugins
LoadPlugin("plugins\DGDecodeNV.dll")
LoadPlugin("plugins\DGCube.dll")
LoadPlugin("plugins\avs_libplacebo.dll")
LoadPlugin("plugins\AddGrainC.dll")
LoadPlugin("plugins\masktools2.dll")
Import("plugins\GrainFactory3.avsi")

# load source and crop it
DGSource("Terminator.2.1991.2160p.BDREMUX.HDR.DATPHYR.dgi").Crop(0,280,0,-280)

# apply lut, planar rgb is required
ConvertToPlanarRGB().DGCube("CUBE\T2_HDR_to_original.cube", in="full", out="full", lut="full")

# retonemap (to hdr and back to sdr)
libplacebo_Tonemap(src_max=100,tone_mapping_function="bt2390",src_csp=0,dst_csp=1)
libplacebo_Tonemap(dst_max=100,tone_mapping_function="bt2390")

# add grain, yuv is required
ConvertToYUV444().GrainFactory3()

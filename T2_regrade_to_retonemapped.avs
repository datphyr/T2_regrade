# load plugins
LoadPlugin("plugins\DGDecodeNV.dll")
LoadPlugin("plugins\DGCube.dll")

# load source and crop it
DGSource("Terminator.2.1991.2160p.BDREMUX.HDR.DATPHYR.dgi").Crop(0,280,0,-280)

# apply lut, planar rgb is required
ConvertToPlanarRGB().DGCube("CUBE\T2_HDR_to_original_retonemapped.cube",in="full",out="full",lut="full")

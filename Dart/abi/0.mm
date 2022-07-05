- (void)writeBytes:(const void*)bytes length:(NSUInteger)length {
  [_data appendBytes:bytes length:length];
}
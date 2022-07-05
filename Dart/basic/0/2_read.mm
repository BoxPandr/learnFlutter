- (nullable id)readValue {
  return [self readValueOfType:[self readByte]];
}



// ---


- (nullable id)readValueOfType:(UInt8)type {
  FlutterStandardField field = (FlutterStandardField)type;
  switch (field) {
    case FlutterStandardFieldNil:
      return nil;
    case FlutterStandardFieldTrue:
      return @YES;
    case FlutterStandardFieldFalse:
      return @NO;
    case FlutterStandardFieldInt32: {
      SInt32 value;
      [self readBytes:&value length:4];
      return @(value);
    }
  }
}
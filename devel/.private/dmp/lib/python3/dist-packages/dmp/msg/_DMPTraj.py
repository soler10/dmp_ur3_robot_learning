# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from dmp/DMPTraj.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import dmp.msg

class DMPTraj(genpy.Message):
  _md5sum = "1d088d86ab60cf6a2671bc3c0e99932b"
  _type = "dmp/DMPTraj"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# points and times should be the same length
DMPPoint[] points

# Times of observations, in seconds, starting at zero
float64[] times



================================================================================
MSG: dmp/DMPPoint
# Positions and velocities of DOFs
#Velocity is only used for movement plans, not for giving demonstrations.
float64[] positions
float64[] velocities


"""
  __slots__ = ['points','times']
  _slot_types = ['dmp/DMPPoint[]','float64[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       points,times

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(DMPTraj, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.points is None:
        self.points = []
      if self.times is None:
        self.times = []
    else:
      self.points = []
      self.times = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.points)
      buff.write(_struct_I.pack(length))
      for val1 in self.points:
        length = len(val1.positions)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(struct.Struct(pattern).pack(*val1.positions))
        length = len(val1.velocities)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(struct.Struct(pattern).pack(*val1.velocities))
      length = len(self.times)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.times))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.points is None:
        self.points = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.points = []
      for i in range(0, length):
        val1 = dmp.msg.DMPPoint()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.positions = s.unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.velocities = s.unpack(str[start:end])
        self.points.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.times = s.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.points)
      buff.write(_struct_I.pack(length))
      for val1 in self.points:
        length = len(val1.positions)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(val1.positions.tostring())
        length = len(val1.velocities)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(val1.velocities.tostring())
      length = len(self.times)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.times.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.points is None:
        self.points = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.points = []
      for i in range(0, length):
        val1 = dmp.msg.DMPPoint()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.positions = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.velocities = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
        self.points.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.times = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
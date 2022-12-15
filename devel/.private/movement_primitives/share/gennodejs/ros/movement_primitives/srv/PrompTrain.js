// Auto-generated. Do not edit!

// (in-package movement_primitives.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class PrompTrainRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.promp_name = null;
    }
    else {
      if (initObj.hasOwnProperty('promp_name')) {
        this.promp_name = initObj.promp_name
      }
      else {
        this.promp_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PrompTrainRequest
    // Serialize message field [promp_name]
    bufferOffset = _serializer.string(obj.promp_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PrompTrainRequest
    let len;
    let data = new PrompTrainRequest(null);
    // Deserialize message field [promp_name]
    data.promp_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.promp_name);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_primitives/PrompTrainRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '401e24503097a56d5cd6705a1036c46d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string promp_name
    #string path_to_training_data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PrompTrainRequest(null);
    if (msg.promp_name !== undefined) {
      resolved.promp_name = msg.promp_name;
    }
    else {
      resolved.promp_name = ''
    }

    return resolved;
    }
};

class PrompTrainResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.traj_data = null;
    }
    else {
      if (initObj.hasOwnProperty('traj_data')) {
        this.traj_data = initObj.traj_data
      }
      else {
        this.traj_data = new std_msgs.msg.UInt32MultiArray();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PrompTrainResponse
    // Serialize message field [traj_data]
    bufferOffset = std_msgs.msg.UInt32MultiArray.serialize(obj.traj_data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PrompTrainResponse
    let len;
    let data = new PrompTrainResponse(null);
    // Deserialize message field [traj_data]
    data.traj_data = std_msgs.msg.UInt32MultiArray.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.UInt32MultiArray.getMessageSize(object.traj_data);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'movement_primitives/PrompTrainResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '595c9731a2b15adf7f3b40e8c7419b64';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #uint32 step
    #uint32[] traj_data
    std_msgs/UInt32MultiArray traj_data
    
    
    ================================================================================
    MSG: std_msgs/UInt32MultiArray
    # Please look at the MultiArrayLayout message definition for
    # documentation on all multiarrays.
    
    MultiArrayLayout  layout        # specification of data layout
    uint32[]          data          # array of data
    
    
    ================================================================================
    MSG: std_msgs/MultiArrayLayout
    # The multiarray declares a generic multi-dimensional array of a
    # particular data type.  Dimensions are ordered from outer most
    # to inner most.
    
    MultiArrayDimension[] dim # Array of dimension properties
    uint32 data_offset        # padding elements at front of data
    
    # Accessors should ALWAYS be written in terms of dimension stride
    # and specified outer-most dimension first.
    # 
    # multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
    #
    # A standard, 3-channel 640x480 image with interleaved color channels
    # would be specified as:
    #
    # dim[0].label  = "height"
    # dim[0].size   = 480
    # dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
    # dim[1].label  = "width"
    # dim[1].size   = 640
    # dim[1].stride = 3*640 = 1920
    # dim[2].label  = "channel"
    # dim[2].size   = 3
    # dim[2].stride = 3
    #
    # multiarray(i,j,k) refers to the ith row, jth column, and kth channel.
    
    ================================================================================
    MSG: std_msgs/MultiArrayDimension
    string label   # label of given dimension
    uint32 size    # size of given dimension (in type units)
    uint32 stride  # stride of given dimension
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PrompTrainResponse(null);
    if (msg.traj_data !== undefined) {
      resolved.traj_data = std_msgs.msg.UInt32MultiArray.Resolve(msg.traj_data)
    }
    else {
      resolved.traj_data = new std_msgs.msg.UInt32MultiArray()
    }

    return resolved;
    }
};

module.exports = {
  Request: PrompTrainRequest,
  Response: PrompTrainResponse,
  md5sum() { return 'bae4a804188261b587b4284e77e5b0ba'; },
  datatype() { return 'movement_primitives/PrompTrain'; }
};

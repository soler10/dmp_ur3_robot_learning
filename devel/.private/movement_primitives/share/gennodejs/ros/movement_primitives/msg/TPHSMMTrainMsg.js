// Auto-generated. Do not edit!

// (in-package movement_primitives.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TPHSMMTrainMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tphsmm_name = null;
      this.path_to_data = null;
      this.num_demos = null;
      this.num_frames = null;
    }
    else {
      if (initObj.hasOwnProperty('tphsmm_name')) {
        this.tphsmm_name = initObj.tphsmm_name
      }
      else {
        this.tphsmm_name = '';
      }
      if (initObj.hasOwnProperty('path_to_data')) {
        this.path_to_data = initObj.path_to_data
      }
      else {
        this.path_to_data = '';
      }
      if (initObj.hasOwnProperty('num_demos')) {
        this.num_demos = initObj.num_demos
      }
      else {
        this.num_demos = 0;
      }
      if (initObj.hasOwnProperty('num_frames')) {
        this.num_frames = initObj.num_frames
      }
      else {
        this.num_frames = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TPHSMMTrainMsg
    // Serialize message field [tphsmm_name]
    bufferOffset = _serializer.string(obj.tphsmm_name, buffer, bufferOffset);
    // Serialize message field [path_to_data]
    bufferOffset = _serializer.string(obj.path_to_data, buffer, bufferOffset);
    // Serialize message field [num_demos]
    bufferOffset = _serializer.int8(obj.num_demos, buffer, bufferOffset);
    // Serialize message field [num_frames]
    bufferOffset = _serializer.int8(obj.num_frames, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TPHSMMTrainMsg
    let len;
    let data = new TPHSMMTrainMsg(null);
    // Deserialize message field [tphsmm_name]
    data.tphsmm_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [path_to_data]
    data.path_to_data = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [num_demos]
    data.num_demos = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [num_frames]
    data.num_frames = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.tphsmm_name);
    length += _getByteLength(object.path_to_data);
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_primitives/TPHSMMTrainMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e4144652d3d9743179c2af47f39a3c3f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string tphsmm_name
    string path_to_data
    int8 num_demos #How many of the demos from path_to_data do you want to use
    int8 num_frames #Number of important frames of reference in the demonstrations
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TPHSMMTrainMsg(null);
    if (msg.tphsmm_name !== undefined) {
      resolved.tphsmm_name = msg.tphsmm_name;
    }
    else {
      resolved.tphsmm_name = ''
    }

    if (msg.path_to_data !== undefined) {
      resolved.path_to_data = msg.path_to_data;
    }
    else {
      resolved.path_to_data = ''
    }

    if (msg.num_demos !== undefined) {
      resolved.num_demos = msg.num_demos;
    }
    else {
      resolved.num_demos = 0
    }

    if (msg.num_frames !== undefined) {
      resolved.num_frames = msg.num_frames;
    }
    else {
      resolved.num_frames = 0
    }

    return resolved;
    }
};

module.exports = TPHSMMTrainMsg;

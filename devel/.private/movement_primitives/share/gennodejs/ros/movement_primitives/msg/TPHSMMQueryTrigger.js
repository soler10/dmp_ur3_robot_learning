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

class TPHSMMQueryTrigger {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tphsmm_name = null;
      this.input_dofs = null;
      this.input = null;
    }
    else {
      if (initObj.hasOwnProperty('tphsmm_name')) {
        this.tphsmm_name = initObj.tphsmm_name
      }
      else {
        this.tphsmm_name = '';
      }
      if (initObj.hasOwnProperty('input_dofs')) {
        this.input_dofs = initObj.input_dofs
      }
      else {
        this.input_dofs = 0;
      }
      if (initObj.hasOwnProperty('input')) {
        this.input = initObj.input
      }
      else {
        this.input = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TPHSMMQueryTrigger
    // Serialize message field [tphsmm_name]
    bufferOffset = _serializer.string(obj.tphsmm_name, buffer, bufferOffset);
    // Serialize message field [input_dofs]
    bufferOffset = _serializer.int8(obj.input_dofs, buffer, bufferOffset);
    // Serialize message field [input]
    bufferOffset = _arraySerializer.float32(obj.input, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TPHSMMQueryTrigger
    let len;
    let data = new TPHSMMQueryTrigger(null);
    // Deserialize message field [tphsmm_name]
    data.tphsmm_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [input_dofs]
    data.input_dofs = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [input]
    data.input = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.tphsmm_name);
    length += 4 * object.input.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_primitives/TPHSMMQueryTrigger';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '883baf93b9caddc4aaf750ea56eb24f1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string tphsmm_name
    int8 input_dofs #Number of via_pts
    float32[] input
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TPHSMMQueryTrigger(null);
    if (msg.tphsmm_name !== undefined) {
      resolved.tphsmm_name = msg.tphsmm_name;
    }
    else {
      resolved.tphsmm_name = ''
    }

    if (msg.input_dofs !== undefined) {
      resolved.input_dofs = msg.input_dofs;
    }
    else {
      resolved.input_dofs = 0
    }

    if (msg.input !== undefined) {
      resolved.input = msg.input;
    }
    else {
      resolved.input = []
    }

    return resolved;
    }
};

module.exports = TPHSMMQueryTrigger;

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

class PrompQueryTrigger {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.promp_name = null;
      this.input_dofs = null;
      this.input = null;
    }
    else {
      if (initObj.hasOwnProperty('promp_name')) {
        this.promp_name = initObj.promp_name
      }
      else {
        this.promp_name = '';
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
    // Serializes a message object of type PrompQueryTrigger
    // Serialize message field [promp_name]
    bufferOffset = _serializer.string(obj.promp_name, buffer, bufferOffset);
    // Serialize message field [input_dofs]
    bufferOffset = _serializer.int8(obj.input_dofs, buffer, bufferOffset);
    // Serialize message field [input]
    bufferOffset = _arraySerializer.float32(obj.input, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PrompQueryTrigger
    let len;
    let data = new PrompQueryTrigger(null);
    // Deserialize message field [promp_name]
    data.promp_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [input_dofs]
    data.input_dofs = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [input]
    data.input = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.promp_name);
    length += 4 * object.input.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_primitives/PrompQueryTrigger';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2a147e77dd4851c94b12ecfd24c9afb4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string promp_name
    int8 input_dofs
    float32[] input
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PrompQueryTrigger(null);
    if (msg.promp_name !== undefined) {
      resolved.promp_name = msg.promp_name;
    }
    else {
      resolved.promp_name = ''
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

module.exports = PrompQueryTrigger;

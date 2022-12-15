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

class PrompTrainMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.promp_name = null;
      this.path_to_data = null;
      this.sensor_dofs = null;
      this.robot_dofs = null;
    }
    else {
      if (initObj.hasOwnProperty('promp_name')) {
        this.promp_name = initObj.promp_name
      }
      else {
        this.promp_name = '';
      }
      if (initObj.hasOwnProperty('path_to_data')) {
        this.path_to_data = initObj.path_to_data
      }
      else {
        this.path_to_data = '';
      }
      if (initObj.hasOwnProperty('sensor_dofs')) {
        this.sensor_dofs = initObj.sensor_dofs
      }
      else {
        this.sensor_dofs = 0;
      }
      if (initObj.hasOwnProperty('robot_dofs')) {
        this.robot_dofs = initObj.robot_dofs
      }
      else {
        this.robot_dofs = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PrompTrainMsg
    // Serialize message field [promp_name]
    bufferOffset = _serializer.string(obj.promp_name, buffer, bufferOffset);
    // Serialize message field [path_to_data]
    bufferOffset = _serializer.string(obj.path_to_data, buffer, bufferOffset);
    // Serialize message field [sensor_dofs]
    bufferOffset = _serializer.int8(obj.sensor_dofs, buffer, bufferOffset);
    // Serialize message field [robot_dofs]
    bufferOffset = _serializer.int8(obj.robot_dofs, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PrompTrainMsg
    let len;
    let data = new PrompTrainMsg(null);
    // Deserialize message field [promp_name]
    data.promp_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [path_to_data]
    data.path_to_data = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [sensor_dofs]
    data.sensor_dofs = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [robot_dofs]
    data.robot_dofs = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.promp_name);
    length += _getByteLength(object.path_to_data);
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_primitives/PrompTrainMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4ac2b3de384f10c19d662ca80d3020f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string promp_name
    string path_to_data
    int8 sensor_dofs #Number of individual numbers in the sensor input
    int8 robot_dofs #Number of controllable robot joints
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PrompTrainMsg(null);
    if (msg.promp_name !== undefined) {
      resolved.promp_name = msg.promp_name;
    }
    else {
      resolved.promp_name = ''
    }

    if (msg.path_to_data !== undefined) {
      resolved.path_to_data = msg.path_to_data;
    }
    else {
      resolved.path_to_data = ''
    }

    if (msg.sensor_dofs !== undefined) {
      resolved.sensor_dofs = msg.sensor_dofs;
    }
    else {
      resolved.sensor_dofs = 0
    }

    if (msg.robot_dofs !== undefined) {
      resolved.robot_dofs = msg.robot_dofs;
    }
    else {
      resolved.robot_dofs = 0
    }

    return resolved;
    }
};

module.exports = PrompTrainMsg;

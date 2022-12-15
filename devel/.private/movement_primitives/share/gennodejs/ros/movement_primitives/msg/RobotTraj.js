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

class RobotTraj {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robot_dofs = null;
      this.traj = null;
    }
    else {
      if (initObj.hasOwnProperty('robot_dofs')) {
        this.robot_dofs = initObj.robot_dofs
      }
      else {
        this.robot_dofs = 0;
      }
      if (initObj.hasOwnProperty('traj')) {
        this.traj = initObj.traj
      }
      else {
        this.traj = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotTraj
    // Serialize message field [robot_dofs]
    bufferOffset = _serializer.int8(obj.robot_dofs, buffer, bufferOffset);
    // Serialize message field [traj]
    bufferOffset = _arraySerializer.float32(obj.traj, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotTraj
    let len;
    let data = new RobotTraj(null);
    // Deserialize message field [robot_dofs]
    data.robot_dofs = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [traj]
    data.traj = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.traj.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'movement_primitives/RobotTraj';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0a5c2376d2b17933b7131c7de868f64e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 robot_dofs
    float32[] traj  
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotTraj(null);
    if (msg.robot_dofs !== undefined) {
      resolved.robot_dofs = msg.robot_dofs;
    }
    else {
      resolved.robot_dofs = 0
    }

    if (msg.traj !== undefined) {
      resolved.traj = msg.traj;
    }
    else {
      resolved.traj = []
    }

    return resolved;
    }
};

module.exports = RobotTraj;

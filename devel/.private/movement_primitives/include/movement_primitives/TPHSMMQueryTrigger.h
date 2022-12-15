// Generated by gencpp from file movement_primitives/TPHSMMQueryTrigger.msg
// DO NOT EDIT!


#ifndef MOVEMENT_PRIMITIVES_MESSAGE_TPHSMMQUERYTRIGGER_H
#define MOVEMENT_PRIMITIVES_MESSAGE_TPHSMMQUERYTRIGGER_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace movement_primitives
{
template <class ContainerAllocator>
struct TPHSMMQueryTrigger_
{
  typedef TPHSMMQueryTrigger_<ContainerAllocator> Type;

  TPHSMMQueryTrigger_()
    : tphsmm_name()
    , input_dofs(0)
    , input()  {
    }
  TPHSMMQueryTrigger_(const ContainerAllocator& _alloc)
    : tphsmm_name(_alloc)
    , input_dofs(0)
    , input(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _tphsmm_name_type;
  _tphsmm_name_type tphsmm_name;

   typedef int8_t _input_dofs_type;
  _input_dofs_type input_dofs;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _input_type;
  _input_type input;





  typedef boost::shared_ptr< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> const> ConstPtr;

}; // struct TPHSMMQueryTrigger_

typedef ::movement_primitives::TPHSMMQueryTrigger_<std::allocator<void> > TPHSMMQueryTrigger;

typedef boost::shared_ptr< ::movement_primitives::TPHSMMQueryTrigger > TPHSMMQueryTriggerPtr;
typedef boost::shared_ptr< ::movement_primitives::TPHSMMQueryTrigger const> TPHSMMQueryTriggerConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator1> & lhs, const ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator2> & rhs)
{
  return lhs.tphsmm_name == rhs.tphsmm_name &&
    lhs.input_dofs == rhs.input_dofs &&
    lhs.input == rhs.input;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator1> & lhs, const ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace movement_primitives

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> >
{
  static const char* value()
  {
    return "883baf93b9caddc4aaf750ea56eb24f1";
  }

  static const char* value(const ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x883baf93b9caddc4ULL;
  static const uint64_t static_value2 = 0xaaf750ea56eb24f1ULL;
};

template<class ContainerAllocator>
struct DataType< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> >
{
  static const char* value()
  {
    return "movement_primitives/TPHSMMQueryTrigger";
  }

  static const char* value(const ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string tphsmm_name\n"
"int8 input_dofs #Number of via_pts\n"
"float32[] input\n"
;
  }

  static const char* value(const ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.tphsmm_name);
      stream.next(m.input_dofs);
      stream.next(m.input);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TPHSMMQueryTrigger_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::movement_primitives::TPHSMMQueryTrigger_<ContainerAllocator>& v)
  {
    s << indent << "tphsmm_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.tphsmm_name);
    s << indent << "input_dofs: ";
    Printer<int8_t>::stream(s, indent + "  ", v.input_dofs);
    s << indent << "input[]" << std::endl;
    for (size_t i = 0; i < v.input.size(); ++i)
    {
      s << indent << "  input[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.input[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVEMENT_PRIMITIVES_MESSAGE_TPHSMMQUERYTRIGGER_H
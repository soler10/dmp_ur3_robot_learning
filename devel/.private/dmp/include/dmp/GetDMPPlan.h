// Generated by gencpp from file dmp/GetDMPPlan.msg
// DO NOT EDIT!


#ifndef DMP_MESSAGE_GETDMPPLAN_H
#define DMP_MESSAGE_GETDMPPLAN_H

#include <ros/service_traits.h>


#include <dmp/GetDMPPlanRequest.h>
#include <dmp/GetDMPPlanResponse.h>


namespace dmp
{

struct GetDMPPlan
{

typedef GetDMPPlanRequest Request;
typedef GetDMPPlanResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetDMPPlan
} // namespace dmp


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::dmp::GetDMPPlan > {
  static const char* value()
  {
    return "5cd79fd80676a4f8f062c5472a3190b1";
  }

  static const char* value(const ::dmp::GetDMPPlan&) { return value(); }
};

template<>
struct DataType< ::dmp::GetDMPPlan > {
  static const char* value()
  {
    return "dmp/GetDMPPlan";
  }

  static const char* value(const ::dmp::GetDMPPlan&) { return value(); }
};


// service_traits::MD5Sum< ::dmp::GetDMPPlanRequest> should match
// service_traits::MD5Sum< ::dmp::GetDMPPlan >
template<>
struct MD5Sum< ::dmp::GetDMPPlanRequest>
{
  static const char* value()
  {
    return MD5Sum< ::dmp::GetDMPPlan >::value();
  }
  static const char* value(const ::dmp::GetDMPPlanRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::dmp::GetDMPPlanRequest> should match
// service_traits::DataType< ::dmp::GetDMPPlan >
template<>
struct DataType< ::dmp::GetDMPPlanRequest>
{
  static const char* value()
  {
    return DataType< ::dmp::GetDMPPlan >::value();
  }
  static const char* value(const ::dmp::GetDMPPlanRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::dmp::GetDMPPlanResponse> should match
// service_traits::MD5Sum< ::dmp::GetDMPPlan >
template<>
struct MD5Sum< ::dmp::GetDMPPlanResponse>
{
  static const char* value()
  {
    return MD5Sum< ::dmp::GetDMPPlan >::value();
  }
  static const char* value(const ::dmp::GetDMPPlanResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::dmp::GetDMPPlanResponse> should match
// service_traits::DataType< ::dmp::GetDMPPlan >
template<>
struct DataType< ::dmp::GetDMPPlanResponse>
{
  static const char* value()
  {
    return DataType< ::dmp::GetDMPPlan >::value();
  }
  static const char* value(const ::dmp::GetDMPPlanResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DMP_MESSAGE_GETDMPPLAN_H
#ifndef hep_concurrency_thread_safe_macros_h 
#define hep_concurrency_thread_safe_macros_h 
#ifndef __ROOTCLING__
#define HEP_CONCURRENCY_THREAD_SAFE [[hc::thread_safe]]
#define HEP_CONCURRENCY_THREAD_GUARD(_var_) [[hc::thread_guard("#_var_")]]
#else 
#define HEP_CONCURRENCY_THREAD_SAFE
#define HEP_CONCURRENCY_THREAD_GUARD(_var_)
#endif
#endif

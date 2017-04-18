#ifndef hc_thread_safe_macros_h 
#define hc_thread_safe_macros_h 
#ifndef __ROOTCLING__
#define HC_THREAD_SAFE [[hc::thread_safe]]
#define HC_THREAD_GUARD(_var_) [[hc::thread_guard("#_var_")]]
#else 
#define HC_THREAD_SAFE
#define HC_THREAD_GUARD(_var_)
#endif
#endif

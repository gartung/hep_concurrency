#ifndef FWCore_Utilites_thread_safe_macros_h 
#define FWCore_Utilites_thread_safe_macros_h 
#ifndef __ROOTCLING__
#define HEP_CONCURRENCY_THREAD_SAFE [[hep_concurrency::thread_safe]]
#define HEP_CONCURRENCY_THREAD_GUARD(_var_) [[hep_concurrency::thread_guard("#_var_")]]
#else 
#define HEP_CONCURRENCY_THREAD_SAFE
#define HEP_CONCURRENCY_THREAD_GUARD(_var_)
#endif
#endif

use strict;

use vars qw(%inc_translations);
BEGIN { %inc_translations = (
          "FWCore/Concurrency/interface/SerialTaskQueueChain.h" => "hc/SerialTaskQueueChain.h",
          "FWCore/Concurrency/interface/ThreadSafeAddOnlyContainer.h" => "hc/ThreadSafeAddOnlyContainer.h",
          "FWCore/Concurrency/interface/hardware_pause.h" => "hc/hardware_pause.h", 
          "FWCore/Concurrency/interface/SerialTaskQueue.h" => "hc/SerialTaskQueue.h",
          "FWCore/Concurrency/interface/ThreadSafeOutputFileStream.h" => "hc/ThreadSafeOutputFileStream.h",
          "FWCore/Concurrency/interface/WaitingTask.h" => "hc/WaitingTask.h",
          "FWCore/Concurrency/interface/WaitingTaskList.h" => "hc/WaitingTaskList.h",
          "FWCore/Utilities/interface/GCCPrerequisite.h" => "hc/GCCPrerequisite.h",
          "FWCore/Utilities/interface/Likely.h" => "hc/Likely.h",
          "FWCore/Utilities/interface/thread_safety_macros.h" => "hc/thread_safety_macros.h",
          "Utilities/Testing/interface/CppUnit_testdriver.icpp" => "CppUnit_testdriver.icpp"
                            );

      }
foreach my $inc (sort keys %inc_translations) {
  s&^(\s*#include\s+["<])\Q$inc\E([">].*)$&${1}$inc_translations{$inc}${2}& and last;
}

### Local Variables:
### mode: cperl
### End:

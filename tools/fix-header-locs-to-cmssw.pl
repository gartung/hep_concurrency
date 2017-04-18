use strict;

use vars qw(%inc_translations);
BEGIN { %inc_translations = (
          "hc/SerialTaskQueueChain.h" => "FWCore/Concurrency/interface/SerialTaskQueueChain.h",
          "hc/ThreadSafeAddOnlyContainer.h" => "FWCore/Concurrency/interface/ThreadSafeAddOnlyContainer.h",
          "hc/hardware_pause.h" => "FWCore/Concurrency/interface/hardware_pause.h", 
          "hc/SerialTaskQueue.h" => "FWCore/Concurrency/interface/SerialTaskQueue.h",
          "hc/ThreadSafeOutputFileStream.h" => "FWCore/Concurrency/interface/ThreadSafeOutputFileStream.h",
          "hc/WaitingTask.h" => "FWCore/Concurrency/interface/WaitingTask.h",
          "hc/WaitingTaskList.h" => "FWCore/Concurrency/interface/WaitingTaskList.h",
          "hc/GCCPrerequisite.h" => "FWCore/Utilities/interface/GCCPrerequisite.h",
          "hc/Likely.h" => "FWCore/Utilities/interface/Likely.h",
          "hc/thread_safety_macros.h" => "FWCore/Utilities/interface/thread_safety_macros.h",
          "CppUnit_testdriver.icpp" => "Utilities/Testing/interface/CppUnit_testdriver.icpp"
                            );

      }
foreach my $inc (sort keys %inc_translations) {
  s&^(\s*#include\s+["<])\Q$inc\E([">].*)$&${1}$inc_translations{$inc}${2}& and last;
}

### Local Variables:
### mode: cperl
### End:

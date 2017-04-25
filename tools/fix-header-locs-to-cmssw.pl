use strict;

use vars qw(%inc_translations);
BEGIN { %inc_translations = (
          "hep_concurrency/SerialTaskQueueChain.h" => "FWCore/Concurrency/interface/SerialTaskQueueChain.h",
          "hep_concurrency/ThreadSafeAddOnlyContainer.h" => "FWCore/Concurrency/interface/ThreadSafeAddOnlyContainer.h",
          "hep_concurrency/hardware_pause.h" => "FWCore/Concurrency/interface/hardware_pause.h", 
          "hep_concurrency/SerialTaskQueue.h" => "FWCore/Concurrency/interface/SerialTaskQueue.h",
          "hep_concurrency/ThreadSafeOutputFileStream.h" => "FWCore/Concurrency/interface/ThreadSafeOutputFileStream.h",
          "hep_concurrency/WaitingTask.h" => "FWCore/Concurrency/interface/WaitingTask.h",
          "hep_concurrency/WaitingTaskList.h" => "FWCore/Concurrency/interface/WaitingTaskList.h",
          "hep_concurrency/GCCPrerequisite.h" => "FWCore/Utilities/interface/GCCPrerequisite.h",
          "hep_concurrency/Likely.h" => "FWCore/Utilities/interface/Likely.h",
          "hep_concurrency/thread_safety_macros.h" => "FWCore/Utilities/interface/thread_safety_macros.h",
          "CppUnit_testdriver.icpp" => "Utilities/Testing/interface/CppUnit_testdriver.icpp"
                            );

      }
foreach my $inc (sort keys %inc_translations) {
  s&^(\s*#include\s+["<])\Q$inc\E([">].*)$&${1}$inc_translations{$inc}${2}& and last;
}

### Local Variables:
### mode: cperl
### End:

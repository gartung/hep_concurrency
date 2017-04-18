use strict;

use vars qw(%inc_translations);
BEGIN { %inc_translations = (
          "FWCore/Concurrency/interface/hardware_pause.h" => "hardware_pause.h", 
          "FWCore/Concurrency/interface/SerialTaskQueue.h" => "SerialTaskQueue.h",
          "FWCore/Concurrency/interface/ThreadSafeOutputFileStream.h" => "ThreadSafeOutputFileStream.h",
          "FWCore/Concurrency/interface/WaitingTask.h" => "WaitingTask.h",
          "FWCore/Concurrency/interface/WaitingTaskList.h" => "WaitingTaskList.h",
          "FWCore/Utilities/interface/GCCPrerequisite.h" => "GCCPrerequisite.h",
          "FWCore/Utilities/interface/Likely.h" => "Likely.h",
          "FWCore/Utilities/interface/thread_safety_macros.h" => "thread_safety_macros.h",
          "Utilities/Testing/interface/CppUnit_testdriver.icpp" => "CppUnit_testdriver.icpp"
                            );

      }
foreach my $inc (sort keys %inc_translations) {
  s&^(\s*#include\s+["<])\Q$inc\E([">].*)$&${1}$inc_translations{$inc}${2}& and last;
}

### Local Variables:
### mode: cperl
### End:

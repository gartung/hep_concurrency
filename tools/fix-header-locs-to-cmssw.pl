use strict;

use vars qw(%inc_translations);
BEGIN { %inc_translations = (
          "hardware_pause.h" => "FWCore/Concurrency/interface/hardware_pause.h", 
          "SerialTaskQueue.h" => "FWCore/Concurrency/interface/SerialTaskQueue.h",
          "ThreadSafeOutputFileStream.h" => "FWCore/Concurrency/interface/ThreadSafeOutputFileStream.h",
          "WaitingTask.h" => "FWCore/Concurrency/interface/WaitingTask.h",
          "WaitingTaskList.h" => "FWCore/Concurrency/interface/WaitingTaskList.h",
          "GCCPrerequisite.h" => "FWCore/Utilities/interface/GCCPrerequisite.h",
          "Likely.h" => "FWCore/Utilities/interface/Likely.h",
          "thread_safety_macros.h" => "FWCore/Utilities/interface/thread_safety_macros.h",
          "CppUnit_testdriver.icpp" => "Utilities/Testing/interface/CppUnit_testdriver.icpp"
                            );

      }
foreach my $inc (sort keys %inc_translations) {
  s&^(\s*#include\s+["<])\Q$inc\E([">].*)$&${1}$inc_translations{$inc}${2}& and last;
}

### Local Variables:
### mode: cperl
### End:

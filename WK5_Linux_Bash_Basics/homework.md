# Homework

1. Complete Scenario 1-4 in the slides.
2. Launch a EC2 instance, then setup a periodic job on your local machine that:
- runs every 5 minutes
- scan the log message that is produced on this EC2 machine since last being queried
-  collect every line of the log message that include string "error" (case insensitive)
- aggregated the collected result into a file and store in to /tmp path, with query timestamp shown in the file name

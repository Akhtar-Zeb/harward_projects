# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

**Reason to adopt**:
This way sends data to all boats in equal way. No boat gets too much data.

**Reason not to adopt**
To find data from one time, we must look on all boats. This takes more time.

## Partitioning by Hour

**Reason to adopt**:
If we know the time, we know which boat has the data. We can look only on one boat.

**Reason not to adopt**
If many data come at same time, one boat will get too much. Other boats get less.

## Partitioning by Hash Value

**Reason to adopt**:
Data go to all boats in fair way, even if many data come at one time.

**Reason not to adopt**
If we want many data in one time range, we need to check all boats.



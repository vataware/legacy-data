This repository contains sample data for all vataware tables, full data for some 'static' tables, and the flag and logo directories.

## Sample data
sample.sql contains a MySQL export of all vataware tables with complete data for 13 flights and all required records in other tables (position reports, aircraft types, etc.) This is intended for developer purposes to not need to import a much larger dataset. Pilot names have been anonymized for privacy purposes.

## Full data
These files are some 'full' MySQL exports from vataware. **Flight, position, and pilot data is not included**. You'll want to import `schema_only.sql` first, which contains all the `CREATE TABLE` instructions, then import the file desired.

## Warranty & License
This is provided for non-commercial, simulation use only. Use for real world navigation or commercial purposes is strictly prohibited. For other licensing terms, see LICENSE.

## Copyright
Except where prior copyright or trademark exists, all contents are copyright 2007-2014 (c) Tim Krajcar.

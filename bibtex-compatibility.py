# Original author: Jon Sterling
# Original source: https://github.com/jonsterling/bibtex-references
# Modified by Kartik for use in qpl-bib

import os
import re
import sys

month_names = {
  1: "jan",
  2: "feb",
  3: "mar",
  4: "apr",
  5: "may",
  6: "jun",
  7: "jul",
  8: "aug",
  9: "sep",
  10: "oct",
  11: "nov",
  12: "dec"
}

if len(sys.argv) < 2:
    print("Usage: python3 bibtex-compatibility.py <db_name>")
    sys.exit(1)

db_name = os.path.basename(sys.argv[1])

old_db = open(db_name + ".bib","r")
new_db = open("bibtex.bib","w")

date_re = re.compile(r"date.*{(\d+)-?(\d+)?.*}")

for line in old_db:
    date_pattern = date_re.search(line)
    if date_pattern:
        new_db.write("  year = {{{0:s}}},\n".format(date_pattern.group(1)))
        # print "  year = {{{0:s}}},\n".format(date_pattern.group(1)),
        if date_pattern.group(2) is not None:
            month = month_names[int(date_pattern.group(2))];
            new_db.write("  month = {},\n".format(month))
    elif "journaltitle" in line:
        new_db.write(line.replace("journaltitle","journal"))
    elif "location" in line:
        new_db.write(line.replace("location","address"))
    elif "eprinttype" in line:
        new_db.write(line.replace("eprinttype","archiveprefix"))
    # the following change is not suitable for techreports
    # elif "institution" in line:
    #     new_db.write(line.replace("institution","school"))
    elif "@online" in line:
        new_db.write(line.replace("@online","@unpublished"))
    elif "@report" in line:
        new_db.write(line.replace("@report","@techreport"))
    elif "@inbook" in line:
        new_db.write(line.replace("@inbook","@incollection"))
    elif "@collection" in line:
        new_db.write(line.replace("@collection","@book"))
    elif "@thesis{Singhal2020" in line:
        new_db.write(line.replace("@thesis","@mastersthesis"))
    elif "@thesis" in line:
        new_db.write(line.replace("@thesis","@phdthesis"))
    else:
      new_db.write(line)
old_db.close()
new_db.close()

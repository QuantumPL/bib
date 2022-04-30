# Original author: Jon Sterling
# Original source: https://github.com/jonsterling/bibtex-references
# Modified by Kartik for use in qpl-bib

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

db_name = sys.argv[1]

old_db = open(db_name + ".bib","r")
new_db = open("bibtex.bib","w")

for line in old_db.readlines():
    date_pattern = re.search("date.*{(\d+)-?(\d+)?.*}",line)
    if date_pattern:
        new_db.write("  year = {{{0:s}}},\n".format(date_pattern.group(1)))
        # print "  year = {{{0:s}}},\n".format(date_pattern.group(1)),
        if date_pattern.group(2) != None:
            month = month_names[int(date_pattern.group(2))];
            new_db.write("  month = {},\n".format(month))
    elif re.search("journaltitle",line):
        new_db.write(line.replace("journaltitle","journal"))
    elif re.search("location",line):
        new_db.write(line.replace("location","address"))
    elif re.search("eprinttype",line):
        new_db.write(line.replace("eprinttype","archiveprefix"))
    # the following change is not suitable for techreports
    # elif re.search("institution",line):
    #     new_db.write(line.replace("institution","school"))
    elif re.search("@online",line):
        new_db.write(line.replace("@online","@unpublished"))
    elif re.search("@report",line):
        new_db.write(line.replace("@report","@techreport"))
    elif re.search("@inbook",line):
        new_db.write(line.replace("@inbook","@incollection"))
    elif re.search("@collection",line):
        new_db.write(line.replace("@collection","@book"))
    elif re.search("@thesis{Singhal2020",line):
        new_db.write(line.replace("@thesis","@mastersthesis"))
    elif re.search("@thesis",line):
        new_db.write(line.replace("@thesis","@phdthesis"))
    else:
      new_db.write(line)
old_db.close()
new_db.close()

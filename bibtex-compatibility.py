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

if len(sys.argv) < 2:
    print("Usage: python3 bibtex-compatibility.py <db_name>")
    sys.exit(1)

db_name = sys.argv[1]

try:
    with open(db_name + ".bib", "r") as old_db:
        with open("bibtex.bib", "w") as new_db:
            for line in old_db:
                # Check for date field (specifically excluding urldate)
                # Use ^\s*date to match from start of line, ensuring we don't match urldate
                date_match = re.search(r"^(\s*)date\s*=\s*{(\d+)-?(\d+)?.*}", line)
                if date_match:
                    indent = date_match.group(1)
                    new_db.write("{0}year = {{{1:s}}},\n".format(indent, date_match.group(2)))
                    if date_match.group(3) is not None:
                        month = month_names[int(date_match.group(3))]
                        new_db.write("{0}month = {1},\n".format(indent, month))
                    continue

                # Field name replacements - only when they appear as keys
                if re.search(r"^\s*journaltitle\s*=", line):
                    new_db.write(re.sub(r"journaltitle", "journal", line, count=1))
                elif re.search(r"^\s*location\s*=", line):
                    new_db.write(re.sub(r"location", "address", line, count=1))
                elif re.search(r"^\s*eprinttype\s*=", line):
                    new_db.write(re.sub(r"eprinttype", "archiveprefix", line, count=1))

                # Entry type replacements - only at the start of entries
                elif line.startswith("@online"):
                    new_db.write(line.replace("@online", "@unpublished", 1))
                elif line.startswith("@report"):
                    new_db.write(line.replace("@report", "@techreport", 1))
                elif line.startswith("@inbook"):
                    new_db.write(line.replace("@inbook", "@incollection", 1))
                elif line.startswith("@collection"):
                    new_db.write(line.replace("@collection", "@book", 1))
                elif line.startswith("@thesis{Singhal2020a"):
                    new_db.write(line.replace("@thesis", "@mastersthesis", 1))
                elif line.startswith("@thesis"):
                    new_db.write(line.replace("@thesis", "@phdthesis", 1))
                else:
                    new_db.write(line)
except FileNotFoundError:
    print(f"Error: {db_name}.bib not found")
    sys.exit(1)

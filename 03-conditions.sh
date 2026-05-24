
number=$1

# gt -> Grater than
# lt -> Less than
# eq -> Equals to
# ne -> Not equal
# ge -> Grater than or equal
#le -> Less than or equal

if [ $number -ge 20 ]; then
    echo "Given number $number is grater than or equal to 20"
else
    echo "Given number $number is less than 20"
fi
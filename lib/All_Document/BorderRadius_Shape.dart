/*
-------Container--------
Container(
decoration: ShapeDecoration(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10),
),
color: Colors.blue,
),
)
---------Card----------
Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
)
---------ElevatedButton / TextButton / OutlinedButton------
ElevatedButton(
////sodu ElevatedButton er jai gai TextButton / OutlinedButton hobe baki sob thik thakba///////
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  onPressed: () {},
  child: Text("Click"),
)
----------Material widget--------------
Material(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
)
------------Dialog / AlertDialog--------
AlertDialog(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
)
----------Different corner control:-------
BorderRadius.only(
  topLeft: Radius.circular(10),
  bottomRight: Radius.circular(20),
)
---------
 */

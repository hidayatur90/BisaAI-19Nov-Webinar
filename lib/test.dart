// // import 'package:flutter/material.dart';
// // import 'form_kontak.dart';

// // import 'database/db_helper.dart';
// // import 'model/kontak.dart';

// // class ListKontakPage extends StatefulWidget {
// //   const ListKontakPage({Key? key}) : super(key: key);

// //   @override
// //   _ListKontakPageState createState() => _ListKontakPageState();
// // }

// // class _ListKontakPageState extends State<ListKontakPage> {
// //   List<Kontak> listKontak = [];
// //   DbHelper db = DbHelper();

// //   @override
// //   void initState() {
// //     //menjalankan fungsi getallkontak saat pertama kali dimuat
// //     _getAllKontak();
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Center(
// //           child: Text("Kontak App"),
// //         ),
// //       ),
// //       body: ListView.builder(
// //           itemCount: listKontak.length,
// //           itemBuilder: (context, index) {
// //             Kontak kontak = listKontak[index];
// //             return Padding(
// //               padding: const EdgeInsets.only(top: 20),
// //               child: ListTile(
// //                 leading: const Icon(
// //                   Icons.person,
// //                   size: 50,
// //                 ),
// //                 title: Text('${kontak.name}'),
// //                 subtitle: Column(
// //                   mainAxisAlignment: MainAxisAlignment.start,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Padding(
// //                       padding: const EdgeInsets.only(
// //                         top: 8,
// //                       ),
// //                       child: Text("Email: ${kontak.email}"),
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.only(
// //                         top: 8,
// //                       ),
// //                       child: Text("Phone: ${kontak.mobileNo}"),
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.only(
// //                         top: 8,
// //                       ),
// //                       child: Text("Company: ${kontak.company}"),
// //                     )
// //                   ],
// //                 ),
// //                 trailing: FittedBox(
// //                   fit: BoxFit.fill,
// //                   child: Row(
// //                     children: [
// //                       // button edit
// //                       IconButton(
// //                           onPressed: () {
// //                             _openFormEdit(kontak);
// //                           },
// //                           icon: const Icon(Icons.edit)),
// //                       // button hapus
// //                       IconButton(
// //                         icon: const Icon(Icons.delete),
// //                         onPressed: () {
// //                           //membuat dialog konfirmasi hapus
// //                           AlertDialog hapus = AlertDialog(
// //                             title: const Text("Information"),
// //                             content: SizedBox(
// //                               height: 100,
// //                               child: Column(
// //                                 children: [
// //                                   Text(
// //                                       "Yakin ingin Menghapus Data ${kontak.name}")
// //                                 ],
// //                               ),
// //                             ),
// //                             //terdapat 2 button.
// //                             //jika ya maka jalankan _deleteKontak() dan tutup dialog
// //                             //jika tidak maka tutup dialog
// //                             actions: [
// //                               TextButton(
// //                                   onPressed: () {
// //                                     _deleteKontak(kontak, index);
// //                                     Navigator.pop(context);
// //                                   },
// //                                   child: const Text("Ya")),
// //                               TextButton(
// //                                 child: const Text('Tidak'),
// //                                 onPressed: () {
// //                                   Navigator.pop(context);
// //                                 },
// //                               ),
// //                             ],
// //                           );
// //                           showDialog(
// //                               context: context, builder: (context) => hapus);
// //                         },
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             );
// //           }),
// //       //membuat button mengapung di bagian bawah kanan layar
// //       floatingActionButton: FloatingActionButton(
// //         child: const Icon(Icons.add),
// //         onPressed: () {
// //           _openFormCreate();
// //         },
// //       ),
// //     );
// //   }

// //   //mengambil semua data Kontak
// //   Future<void> _getAllKontak() async {
// //     //list menampung data dari database
// //     var list = await db.getAllKontak();

// //     //ada perubahanan state
// //     setState(() {
// //       //hapus data pada listKontak
// //       listKontak.clear();

// //       //lakukan perulangan pada variabel list
// //       list!.forEach((kontak) {
// //         //masukan data ke listKontak
// //         listKontak.add(Kontak.fromMap(kontak));
// //       });
// //     });
// //   }

// //   //menghapus data Kontak
// //   Future<void> _deleteKontak(Kontak kontak, int position) async {
// //     await db.deleteKontak(kontak.id!);
// //     setState(() {
// //       listKontak.removeAt(position);
// //     });
// //   }

// //   //membuka halaman edit Kontak
// //   Future<void> _openFormEdit(Kontak kontak) async {
// //     var result = await Navigator.push(context,
// //         MaterialPageRoute(builder: (context) => FormKontak(kontak: kontak)));
// //     if (result == 'update') {
// //       await _getAllKontak();
// //     }
// //   }
// // }

// import 'package:flutter/material.dart';
//     import 'database/db_helper.dart';
//     import 'model/kontak.dart';
    
    
//     class FormKontak extends StatefulWidget {
//         final Kontak? kontak;
    
//         FormKontak({this.kontak});
    
//         @override
//         _FormKontakState createState() => _FormKontakState();
//     }
    
//     class _FormKontakState extends State<FormKontak> {
//         DbHelper db = DbHelper();
    
//         TextEditingController? name;
//         TextEditingController? lastName;
//         TextEditingController? mobileNo;
//         TextEditingController? email;
//         TextEditingController? company;
    
//         @override
//         void initState() {
//         name = TextEditingController(
//             text: widget.kontak == null ? '' : widget.kontak!.name);
    
//         mobileNo = TextEditingController(
//             text: widget.kontak == null ? '' : widget.kontak!.mobileNo);
    
//         email = TextEditingController(
//             text: widget.kontak == null ? '' : widget.kontak!.email);
    
//         company = TextEditingController(
//             text: widget.kontak == null ? '' : widget.kontak!.company);
            
//         super.initState();
//         }
    
//         @override
//         Widget build(BuildContext context) {
//         return Scaffold(
//             appBar: AppBar(
//             title: Text('Form Kontak'),
//             ),
//             body: ListView(
//             padding: EdgeInsets.all(16.0),
//             children: [
//                 Padding(
//                 padding: const EdgeInsets.only(
//                     top: 20,
//                 ),
//                 child: TextField(
//                     controller: name,
//                     decoration: InputDecoration(
//                         labelText: 'Name',
//                         border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         )),
//                 ),
//                 ),
//                 Padding(
//                 padding: const EdgeInsets.only(
//                     top: 20,
//                 ),
//                 child: TextField(
//                     controller: mobileNo,
//                     decoration: InputDecoration(
//                         labelText: 'Mobile No',
//                         border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         )),
//                 ),
//                 ),
//                 Padding(
//                 padding: const EdgeInsets.only(
//                     top: 20,
//                 ),
//                 child: TextField(
//                     controller: email,
//                     decoration: InputDecoration(
//                         labelText: 'Email',
//                         border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         )),
//                 ),
//                 ),
//                 Padding(
//                 padding: const EdgeInsets.only(
//                     top: 20,
//                 ),
//                 child: TextField(
//                     controller: company,
//                     decoration: InputDecoration(
//                         labelText: 'Company',
//                         border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         )),
//                 ),
//                 ),
//                 Padding(
//                 padding: const EdgeInsets.only(
//                     top: 20
//                 ),
//                 child: ElevatedButton(
//                     child: (widget.kontak == null)
//                         ? Text(
//                             'Add',
//                             style: TextStyle(color: Colors.white),
//                         )
//                         : Text(
//                             'Update',
//                             style: TextStyle(color: Colors.white),
//                         ),
//                     onPressed: () {
//                     upsertKontak();
//                     },
//                 ),
//                 )
//             ],
//             ),
//         );
//         }
    
//         Future<void> upsertKontak() async {
//         if (widget.kontak != null) {
//             //update
//             await db.updateKontak(Kontak.fromMap({
//             'id' : widget.kontak!.id,
//             'name' : name!.text,
//             'mobileNo' : mobileNo!.text,
//             'email' : email!.text,
//             'company' : company!.text
//             }));
//             Navigator.pop(context, 'update');
//         } else {
//             //insert
//             await db.saveKontak(Kontak(
//             name: name!.text,
//             mobileNo: mobileNo!.text,
//             email: email!.text,
//             company: company!.text,
//             ));
//             Navigator.pop(context, 'save');
//         }
//         }
//     }

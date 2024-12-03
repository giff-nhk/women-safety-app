

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:liki_pro/child/bottomscreens/add_contacts.dart';
import 'package:liki_pro/db/deservices.dart';
import 'package:liki_pro/model/contactsm.dart';
import 'package:liki_pro/ulits/constant.dart';
import 'package:permission_handler/permission_handler.dart';

class Contactscreen extends StatefulWidget {
  const Contactscreen({super.key});

  @override
  State<Contactscreen> createState() => _ContactscreenState();
}

class _ContactscreenState extends State<Contactscreen> {
List<Contact>contacts=[];
DatabaseHelper _databaseHelper=DatabaseHelper();
  @override
  void initState()
  {
    super.initState();
    askPermissions();
  }
 Future<void>  askPermissions()async{
  PermissionStatus permissionStatus=await getContactsPermissons();
  if (permissionStatus==PermissionStatus.granted) {

    getAllcontacts();
    
  } else {
    handleInvaliedPermissions(permissionStatus);
  }
  }

  handleInvaliedPermissions(PermissionStatus permissionStatus)
  {
    if(permissionStatus==PermissionStatus.denied){
      dialogueBox(context, "acess to the conatac denoed");
    }else if(permissionStatus==PermissionStatus.permanentlyDenied){
        dialogueBox(context,"may contact does exit in this");
    }
  }
   Future<PermissionStatus> getContactsPermissons() async {
    PermissionStatus permission=await Permission.contacts.status;
    if(permission!=PermissionStatus.granted && permission != PermissionStatus.permanentlyDenied){
       PermissionStatus permissionStatus = await Permission.contacts.request();
       return permissionStatus;    
    }else{
        return permission;
    }
   }

   getAllcontacts()async{
    List<Contact> _contacts=await ContactsService.getContacts();
    setState(() {
      contacts=_contacts;
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: contacts.length == 0 ? Center(child:CircularProgressIndicator())


     :ListView.builder(
          

        itemCount: contacts.length ,
        itemBuilder: (BuildContext context,int index){
          Contact contact = contacts[index];
          return ListTile(
            title: Text(contact.displayName ?? 'No Name Available'),
            leading: contact.avatar != null &&
                                        contact.avatar!.length > 0
                                    ? CircleAvatar(
                                        backgroundColor: const Color.fromARGB(255, 86, 176, 245),
                                        backgroundImage:
                                            MemoryImage(contact.avatar!),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: const Color.fromARGB(255, 32, 101, 204),
                                        child: Text(contact.initials()),
                                      ),
                                      onTap: (){
                                       if (contact.phones!.length>0) {
                                         final String phoneNum=contact.phones!.elementAt(0).value!;

                                         final String name=contact.displayName!;
                                         _addContact(TContact(phoneNum, name));


                                       } else {
                                          Fluttertoast.showToast(msg: "OOps ! not exit");
                                       }
                                      },
          );
        },
      ),
    );
  }

  void _addContact(TContact newContact) async {
    int result = await _databaseHelper.insertContact(newContact);
    if (result != 0) {
      Fluttertoast.showToast(msg: "contact added successfully");
    } else {
      Fluttertoast.showToast(msg: "Failed to add contacts");
    }
    Navigator.of(context).pop(true);
  }
}
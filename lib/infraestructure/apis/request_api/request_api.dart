import '../../../domain/domain.dart';
import '../../helpers/helpers.dart';

/* API que se encarga de implementar los eventos del RequestRepositorie y hace uso de los helpers para poder  
  implementar las funcionalidades requeridas
*/
class RequestApi implements RequestRepositorie {
  // Helper encargado de la base de datos de firebase
  final storeHelper = StoreFirebaseHelper();
  // Helper encargado de guardados de archivos de firebase
  final storageHelper = StorageFirebaseHelper();
  
  @override
  // Funcion que el usuario realiza cuando quiere realizar una solicitud de creación de cuenta
  Future<String?> requestRegister(RequestModel request) async {
    // Funcion que verifica si el usuario que ingreso su información como correo y número de telefono ya existe en nuestra base de datos
    final userExist = await storeHelper.userCollection
        .verifyIfUserExistWithEmail(request.email!, request.phoneNumber!);
    // Si regresa que existe, regresamo un string para notificar a la vista
    if (userExist) return 'USER EXIST';

    // Si no existe, procedemos a realizar la creación de la solicitud y obtenemos el id del registro creado
    final idRequest =
        await storeHelper.requestCollection.createRequest(request);
    // Si nos regresa null es porque dio un error al momento de crear la solicitud
    if (idRequest == null) return null;
    // Si fue existoso el guardado de datos procedemos a guardar la foto de la identificación del usuario en firebase
    final didSaveImage = await storageHelper.requestReference
        .saveImageRequest(idRequest, request.image!);
    // Si fue exitoso regresamos el id del registro, si no regresamos null
    return didSaveImage ? idRequest : null;
  }

  @override
  // Funcion que nos sirve para verificar si el registro realizado previamente ya ha sido rechazado o aceptado
  Future<bool?> hasRegistrationAcepted(String idRegistration) async {
    return await storeHelper.requestCollection
        .isRequestAceptedById(idRegistration);
  }

  @override
  //Función que se encarga de eliminar un registro que el usuario previamente ha realizado
  Future<bool> deleteRequest(String idRegistration) async {
    // Primero realizamos la eliminación en la base de datos
    final didDeleteRequestStore =
        await storeHelper.requestCollection.delteRequestById(idRegistration);
    // Si no se eliminó, regresamos un false
    if (!didDeleteRequestStore) return false;
    // Si fue exitoso eliminamos la imagen de la identificación del usuario en base de datos
    final didDeleteImageStorage = await storageHelper.requestReference
        .deleteImageRequestById(idRegistration);
    // Si no se eliminó, regresamos un false
    if (!didDeleteImageStorage) return false;
    // Si salió todo bien regresamos un true
    return true;
  }
}

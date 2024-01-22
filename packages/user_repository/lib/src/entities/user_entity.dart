import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
	final String userId;
	final String email;
	final String name;
  final String surname;
  final String phone;

	const MyUserEntity({
		required this.userId,
		required this.email,
		required this.name,
    required this.surname,
    required this.phone
	});

	Map<String, Object?> toDocument() {
		return {
			'userId': userId,
			'email': email,
			'name': name,
      'surname': surname,
      'phone': phone
		};
	}

	static MyUserEntity fromDocument(Map<String, dynamic> doc) {
		return MyUserEntity(
			userId: doc['userId'], 
			email: doc['email'], 
			name: doc['name'],
      surname: doc['surname'],
      phone: doc['phone']
		);
	}

	@override
	List<Object?> get props => [userId, email, name];

}
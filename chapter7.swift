//Enum
enum Month: Int {
    case january = 1
    case february = 2
    case march = 3
}

//Month 는 Int 값을 원시값 으로 가지도록 정의되어 있다.
let mon = Month.january.rawValue
print(mon)

//원시값으로 enum 만들기
if let feb = Month(rawValue: 3) {
    print(feb)
}
/*
반환값이 옵셔널인 이유는 정의되지 않는 원시값을 가지고 생성하려고할 경우 
nil을 반환하기 때문이다.
enum의 원시값은 Int 타입만을 갖지 않는다.
*/

enum IssuState: String {
    case open = "open"
    case closed = "closed"
}

enum NetworkError {
    //enum은 연관값을 가질 수 있다. 아래의 케이스는 필드 이름과 메시지를 가진다.
    case invalidParameter(String, String)
    case timeout
}

let error: NetworkError = .invalidParameter("email", "이메일 형식이 올바르지 않습니다.")

//이 값을 꺼내오기 위해서는 if-case 나 switch 구문이 필요하다.
if case .invalidParameter(let field, let message) = error {
    print(field)
    print(message)
}

switch error{
    case .invalidParameter(let field, let message):
        print(field)
        print(message)
    default:
        break
}
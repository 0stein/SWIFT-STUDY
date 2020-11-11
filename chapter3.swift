//Swift에서는 nil 값이 할당되지 않은 것을 의미합니다.
var name = ""   //이 처럼 비어있는 값은 비어있는 값이 할 당되어있는 것입니다.
var languages: [String] = []    //배열도 마찬가지로 값이 비어있을 뿐, nil 이 아닙니다.
// name = nil 처럼 할당된 변수에 nil을 넣으려고 하면 에러가 발생합니다.

//값이 nil 일 수도 있고 아닐 수 도 있는 변수는 타입 어노테이션에 ? 를 붙입니다.
//이렇게 정의한 변수는 Optional 이라고 합니다.

var email: String? //옵셔널의 초깃값을 지정하지 않으면 기본 값은 nil 입니다.
// print(email) -> nil

email = "abc@abc.com"
// print(email)    // -> Optional("abc@abc.com")

//옵셔널 로 정의한 변수는 옵셔널이 아닌 변수와 다릅니다.
let optionalEmail: String? = "abcd@abcd.com"
//let requiredEmail: String = optionalEmail   //컴파일 에러


//옵셔널에 있는 값을 가져오는 방법.
//값이 nil 이 아니라면 내부 로직 수행, nil이라면 통과.
if let oEmail = optionalEmail {
    print(oEmail)
}

var optionalName: String? = "김인직"
var optionalEmail2: String? = "injick@naver.com"

//if 문에서 콤마로 구분하여 여러 옵셔널을 바인딩 할 수 있다.
//이곳에 사용된 모든 옵셔널의 값이 존재해야 내부로직을 수행.
if let oName = optionalName, let oEmail2 = optionalEmail2{
    print(oName)
    print(oEmail2)
}

var optionalAge: Int? = 22

if let age = optionalAge, age >= 20{
    //age 값이 존재하고, 20이상인 경우.
    print("age값이 존재하며 20 이상입니다.")
}



//옵셔널 체이닝.
let array: [String]? = []
var isEmptyArray = false

//배열이 nil인지, nil이 아니라면 비어있는 배열인지 검사.
if let array = array, array.isEmpty {
    isEmptyArray = true
} else {
    isEmptyArray = false
}

isEmptyArray = array?.isEmpty == true
//옵셔널 바인딩 과정을 ? 키워드로 함축시킴.

print(optionalEmail!) //! 키워드로 옵셔널에 값이 있다고 가정하고 값에 바로 접근.
//옵셔널이 nil일 경우 런타임에 에러가 발생한다.

//옵셔널을 생성할 때 ? 대신 !를 사용하면 암묵적으로 벗겨진 옵셔널을 선언한다.
var email3: String! = "bbka@asdf.com"
print(email3)
//nil 을 포함할 수 있는 옵셔널이긴 한데 접근 할 시 옵셔널 바인딩이나 옵셔널을
//벗기는 과정이 필요없이 바로 접근 가능. (비추)
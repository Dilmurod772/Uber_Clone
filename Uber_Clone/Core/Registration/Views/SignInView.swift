
import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @ObservedObject var viewModel = SignInViewModel()
    
    func doSignIn() {
           viewModel.apiSignIn(email: email, password: password, completion: {result in
               if !result{
                   // when error, show dialog or toast
               }
           })
       }
    
    var body: some View {
        NavigationView{
            ZStack{
                
                //MARK: Background Color
                
                LinearGradient(gradient: Gradient(colors: [Utils.color2, Utils.color1]), startPoint: .bottom, endPoint: .top)
                
                //MARK: Sign In details - text, email, password.
                
                VStack(spacing: 0){
                    Spacer()
                    Text("Uber")
//                        .font(Font.custom("Billabong", size: 45))
                        .font(.system(size: 45))
                        .foregroundColor(.white)
                    
                    TextField("Email", text: $email)
                        .frame(height: 50).padding(.leading,10)
                        .foregroundColor(.white)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top, 10)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .frame(height: 50).padding(.leading,10)
                        .foregroundColor(.white)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top, 10)
                    
                    Button(action: {
                        doSignIn()
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.5)
                                .foregroundColor(.white.opacity(0.4))
                            )
                    }).padding(.top, 10)
                    
                    Spacer()
                    VStack{
                        HStack{
                            Text("Don't have an account?").foregroundColor(.white)
                            NavigationLink(destination: SignUpView(), label: {
                                Text("Sign Up").foregroundColor(.white).fontWeight(.bold)
                            })
                        }
                    }.frame(maxWidth: .infinity, maxHeight: 70)
                }.padding()
                
                if viewModel.isLoading{
                    ProgressView()
                }
                
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}


import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject var viewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentation
    @State var isLoading = false
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    @State var cpassword = ""
    
    func doSignUp(){
            viewModel.apiSignUp(email: email, password: password, completion: {result in
                if !result{
                    // when error, show dialog or toast
                }else{
                    //save user to Firestore
                    var user = User(email: email, displayName: fullname, password: password, imgUser: "")
                    user.uid = session.session?.uid
                    viewModel.apiStoreUser(user: user)
                    presentation.wrappedValue.dismiss()
                }
            })
        }
    
    var body: some View {
        NavigationView{
                   ZStack{
                       LinearGradient(gradient: Gradient(colors: [Utils.color1,Utils.color2]), startPoint: .bottom, endPoint: .top)
                       
                       VStack(spacing: 0){
                           Spacer()
                           
                           Text("Uber").foregroundColor(.white)
//                               .font(Font.custom("Billabong", size: 45))
                               .foregroundColor(.white)
                               .font(.system(size: 45))
                           
                           TextField("Fullname", text: $fullname)
                               .frame(height: 50).padding(.leading,10)
                               .foregroundColor(.white)
                               .background(Color.white.opacity(0.4)).cornerRadius(8)
                               .padding(.top,10)
                           
                           TextField("Email", text: $email)
                               .frame(height: 50).padding(.leading,10)
                               .foregroundColor(.white)
                               .background(Color.white.opacity(0.4)).cornerRadius(8)
                               .padding(.top,10)
                               .autocapitalization(.none)
                               
                           
                           SecureField("Password", text: $password)
                               .frame(height: 50).padding(.leading,10)
                               .foregroundColor(.white)
                               .background(Color.white.opacity(0.4)).cornerRadius(8)
                               .padding(.top,10)
                           
                           SecureField("Cofirm password", text: $cpassword)
                               .frame(height: 50).padding(.leading,10)
                               .foregroundColor(.white)
                               .background(Color.white.opacity(0.4)).cornerRadius(8)
                               .padding(.top,10)
                           
                           Button(action: {
                               doSignUp()
                           }, label: {
                               Text("Sign Up")
                                   .foregroundColor(.white)
                                   .frame(maxWidth: .infinity)
                                   .padding()
                                   .background(
                                       RoundedRectangle(cornerRadius: 8)
                                           .stroke(lineWidth: 1.5)
                                           .foregroundColor(.white.opacity(0.4))
                                   )
                           }).padding(.top,10)
                           Spacer()
                           
                           VStack{
                               
                               HStack{
                                   Text("Already have an account").foregroundColor(.white)
                                   Button(action: {
                                       self.presentation.wrappedValue.dismiss()
                                   }, label: {
                                       Text("Sign In").foregroundColor(.white).fontWeight(.bold)
                                   })
                                   
                               }
                           }.frame(maxWidth:.infinity, maxHeight: 70)
                           
                       }.padding()
                       
                       if viewModel.isLoading {
                           ProgressView()
                       }
                   }
                   .edgesIgnoringSafeArea(.all)
                   
               }
               .navigationBarBackButtonHidden(true)
               .accentColor(.white)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

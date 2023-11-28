import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DisneyCharactersViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                ForEach(viewModel.disneyCharacters, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text("Name: \(index.name!)").foregroundColor(.black)
                         //  Text("Films: \(index.films!)")
                        //Text("Image URL: \(index.imageUrl!)")
                        Text("Created At: \(index.createdAt!)")
                        Text("Updated At: \(index.updatedAt!)")
                    }
                    
                    
                }
               
            }.onAppear {
                viewModel.fetchDisneyCharacters()
        }
        } .navigationTitle("Disney Characters")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

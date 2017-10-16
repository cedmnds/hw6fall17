
describe Movie do
  describe 'searching Tmdb by keyword' do
    context 'with valid key' do
      it 'should call Tmdb with title keywords' do
        expect( Tmdb::Movie).to receive(:find).with('Inception')
        Movie.find_in_tmdb('Inception')
      end
    end
    
     it 'should return a non-empty array with valid search option' do
        return_val = Movie.find_in_tmdb('Ted')
        expect(return_val).not_to be_empty
      end
      
      it 'should return an empty array with an invalid movie title' do
        return_val = Movie.find_in_tmdb('InvlaidMovieTitleHere')
        expect(return_val).to be_empty
      end
    end
    context 'with invalid key' do
      it 'should raise InvalidKeyError if key is missing or invalid' do
        allow(Tmdb::Movie).to receive(:find).and_raise(Tmdb::InvalidApiKeyError)
        expect {Movie.find_in_tmdb('Inception') }.to raise_error(Movie::InvalidKeyError)
    end
  end
end

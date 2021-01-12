if (document.URL.match(/users/) || document.URL.match(/edit/)) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImagePreview = document.getElementById('image-preview');

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するdiv要素を生成
      const imageElement = document.createElement('div');
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
  
      // 生成したHTML要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImagePreview.appendChild(imageElement);
    };

    document.getElementById('profile_image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに表示している画像を削除する
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      };

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const clickUpload = document.getElementById('file-field');
    const imageBoxBig = document.getElementById("pre-images");

    const createImageHTML = (blob, index) => {
      
      // blob・・・画像データ  index・・・番号
      const imageDataIndex = document.querySelector(`#pre-images[data-index="${index}"]`);

      if (imageDataIndex === null){

        // 画像を表示するためのdiv要素を生成
        const imageBox = document.createElement('div');
        imageBox.setAttribute('id', "image-box")
        imageBox.setAttribute('class', "image-box")
        imageBox.setAttribute('data-index', index)
              
        // 表示する画像を生成
        const blobImage = document.createElement('img');
        blobImage.setAttribute('src', blob);
        blobImage.setAttribute('class', 'img-preview');

        // ファイル選択ボタンを生成
        const inputHTML = document.createElement('input')
        inputHTML.setAttribute('id', `event-image-${index}`)
        inputHTML.setAttribute('name', 'event[images][]')
        inputHTML.setAttribute('type', 'file')
        inputHTML.setAttribute('class', 'upload-btn')
        inputHTML.setAttribute('data-index', index+1)
        // 次にボタンを押した時に撮ってこれるindexの値となる

        // ラベルのfor属性を変更
        clickUpload.setAttribute('for', `event-image-${index}`)

        // 生成したHTMLの要素をブラウザに表示させる
        imageBox.appendChild(blobImage);        
        imageBoxBig.appendChild(imageBox);
        clickUpload.appendChild(inputHTML);

        // imageBoxBigの中に編集ボタン、削除ボタンを生成
        const HTML = `
            <div class = "change-box-edit-delete">
              <div class = "change-box" id = event-image-edit-${index} data-index="${index}" >編集</div>
              <div class = "change-box" id = event-image-delete-${index} data-index="${index}" >削除</div>
            </div>` ;
        imageBox.insertAdjacentHTML("beforeend", HTML);
          
        // 編集ボタン押した時の挙動
        const editImage = document.getElementById(`event-images-edit-${index}`);
          editImage.addEventListener('click',function(e){
            const targetIndex = e.target.dataset.index;  //専用のメソッド dataset getAttributeでもいける？
            const fileField = document.querySelector(`input[type="file"][data-index="${targetIndex}"]`); //属性セレクター
            fileField.click();  //ボタンをクリックさせてる
            const blobImage = imageDataIndex.querySelector('img');
            blobImage.setAttribute('src', blob);
          });

        //削除ボタンを押した時の挙動
        const deleteImage = document.getElementById(`event-images-delete-${index}`);
        console.log(deleteImage)
          deleteImage.addEventListener("click", function(e){
            const targetIndex = e.target.dataset.index;
            const fileField = document.querySelector(`input[type="file"][data-index="${targetIndex}"]`);
            const ImageElement = document.querySelector(`.image-box[data-index="${targetIndex}"]`)
                                                        //.image-boxに紐づくデータを取得.image-boxのデータもとってこれる
            fileField.remove()
            ImageElement.remove()
          });

        // ファイルにデータが入ったら再度発火
        inputHTML.addEventListener('change',(e) => {
          const file = e.target.files[0];
          const blob = window.URL.createObjectURL(file);
          const index = Number(e.target.dataset.index);
          createImageHTML(blob, index)
        });
      } else {
        const blobImage = imageDataIndex.querySelector('img');
        blobImage.setAttribute('src', blob);
      }
      

    };

    document.getElementById('event-images').addEventListener('change', (e) => {
      let file = e.target.files[0]; //1マイ限定なのでこの書き方
      let blob = window.URL.createObjectURL(file);
      let index = Number(e.target.getAttribute('data-index'))
      createImageHTML(blob,index);
    });
  });
}

import { Controller } from '@hotwired/stimulus';
import EditorJS from '@editorjs/editorjs';
import Header from '@editorjs/header';
import LinkTool from '@editorjs/link';
import ImageTool from '@editorjs/image';
import ListTool from '@editorjs/list';
// import SimpleImage from '@editorjs/simple-image';
export default class extends Controller {
  connect() {
    // console.log(this.element);
    console.log('in');
    const editor1 = new EditorJS({
      holder: 'edtorjs_self_introduction',
      autofocus: true,
      css: {
        block: 'custom-block-style',
      },
      tools: {
        header: {
          class: Header,
          shortcut: 'CMD+SHIFT+H',
          config: {
            placeholder: 'Enter a header',
            levels: [2, 3, 4],
            defaultLevel: 2,
            inlineToolbar: true,
          },
        },
        list: {
          class: ListTool,
          config: {
            defaultStyle: 'unordered',
          },
        },
        linkTool: {
          class: LinkTool,
          config: {
            endpoint: 'http://localhost:3000/fetchUrl',
          },
        },
        image: {
          class: ImageTool,
          config: {
            endpoints: {
              byFile: 'http://localhost:3000/uploadFile',
              byUrl: 'http://localhost:3000/fetchUrl',
            },
          },
        },
      },
    });
    const editor2 = new EditorJS({
      holder: 'work_state',
      autofocus: true,
      css: {
        block: 'custom-block-style',
      },
      tools: {
        list: {
          class: ListTool,
          config: {
            defaultStyle: 'unordered',
          },
        },
      },
    });
    const editor3 = new EditorJS({
      holder: 'protofolio',
      autofocus: true,
      css: {
        block: 'custom-block-style',
      },
      tools: {
        list: {
          class: ListTool,
          config: {
            defaultStyle: 'unordered',
          },
        },
      },
    });
  }
  _createImage(url, captionText) {
    const image = document.createElement('img');
    const caption = document.createElement('div');
    image.src = url;
    caption.contentEditable = true;
    caption.innerHTML = captionText || '';
    this.wrapper.innerHTML = '';
    this.wrapper.appendChild(image);
    this.wrapper.appendChild(caption);
  }
  save(blockContent) {
    const image = blockContent.querySelector('img');
    const caption = blockContent.querySelector('[contenteditable]');
    return {
      url: image.src,
      caption: caption.innerHTML || '',
    };
  }
}

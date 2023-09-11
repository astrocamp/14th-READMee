import { Controller } from '@hotwired/stimulus';
import Swal from 'sweetalert2';

export default class extends Controller {
  connect() {
    this.Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      target: '#custom-target',
      iconColor: 'orange',
      customClass: {
        popup: 'colored-toast',
        container: 'position-absolute',
      },
      showConfirmButton: false,
      timer: 1500,
      timerProgressBar: true,
    });
  }

  show_alert() {
    this.Toast.fire({
      icon: 'error',
      title: '請先建立個人資料!',
    });
  }
}

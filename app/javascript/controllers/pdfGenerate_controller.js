import { Controller } from "@hotwired/stimulus"
import { jsPDF } from "jspdf";
import html2canvas from "html2canvas";

export default class extends Controller {
  static targets = ["pdfContent"]
  connect() {
    const generatePdfBtn = document.getElementById('generatePdfBtn');
    generatePdfBtn.addEventListener('click', this.generate.bind(this));
  }

  generate() {
    const pdfContent = this.pdfContentTarget
    
    html2canvas(pdfContent).then((canvas) => {
      const pageData = canvas.toDataURL("image/jpeg", 1.0);
  
      const pdf = new jsPDF('', 'pt', 'a4');
  
      pdf.addImage(pageData, "JPEG", 0, 0, 595.28, 592.28 * canvas.height / canvas.width);
      pdf.save("resume.pdf");
    });
  }
}

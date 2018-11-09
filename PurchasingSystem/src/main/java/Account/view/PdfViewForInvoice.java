package Account.view;


import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import Account.model.Accout_PayableBean;

public class PdfViewForInvoice extends AbstractITextPdfView {

	protected Document newDocument() {
		return new Document(PageSize.A4.rotate());
	}


	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		List<Accout_PayableBean> list = (List<Accout_PayableBean>) model.get("infoList");  
		
		Paragraph title=new Paragraph();//新增一個段落，類似html的<p>
		title.add(new Chunk("廠商帳款清單")); //新增一個字串然後加到Paragraph
		document.add(title); //每個element都要加到document才會顯示
		
		Paragraph reportdate=new Paragraph();//新增一個段落，類似html的<p>
		reportdate.add(new Chunk("產生日期:")+new Date().toString()); //新增一個字串然後加到Paragraph
		document.add(reportdate); //每個element都要加到document才會顯示
		
		PdfPTable table=new PdfPTable(11); //初始化Table然後指定欄位數目
		table.setWidthPercentage(100.0f); //設定Table填滿至頁面Margin          
		table.setWidths(new int[] {1,2,1,1,2,1,2,1,2,1,2});//設定相對欄寬                      
		table.setSpacingBefore(10);
		
		BaseFont bfChinese = BaseFont.createFont("C:/WINDOWS/Fonts/MSJH.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		Font font = new Font(bfChinese, 12, Font.NORMAL);
		
		
		PdfPCell cell = new PdfPCell(); //初始化Cell(欄位)
		cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        
		cell.setPhrase(new Phrase("廠商帳款單號",font)); //填入Cell欄位字串，要new一個Phrase
		cell.setHorizontalAlignment(Element.ALIGN_CENTER); //置中對齊
		table.addCell(cell); //cell加到table中
		
		cell.setPhrase(new Phrase("請款單單號",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("廠商名稱",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("廠商結帳週期",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("應付款項金額",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("產生日期",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("支票號碼",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("匯款帳號",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("預計付款日",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("付款狀況",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("實付金額",font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		
		
		
		Integer recordCounts=1; 
		for(Accout_PayableBean bean:list){ //利用for迴圈，把資料填入Cell
			table.addCell(bean.getAccoutpayable_no());
			table.addCell(bean.getInv_id());
			table.addCell(bean.getpO_Vendor_InfoBean().getVendor_name());
			table.addCell(bean.getpO_Vendor_InfoBean().getPayment_term());
			table.addCell(bean.getAmount_Payable().toString());
			table.addCell(bean.getBooking_Date().toString());
			table.addCell(bean.getCheque_no());
			table.addCell(bean.getpO_Vendor_InfoBean().getVendor_acc());
			table.addCell(bean.getExcept_Payment_Date().toString());
			table.addCell(bean.getPayable_Status());
			table.addCell(bean.getAmount_Paid().toString());
			recordCounts++;
		}
		document.add(table); //table加到document顯示
		
		Paragraph totalCounts=new Paragraph();//新增一個段落，類似html的<p>
		totalCounts.add(new Chunk("總筆數:")+recordCounts.toString()); //新增一個字串然後加到Paragraph
		document.add(totalCounts); //每個element都要加到document才會顯示
		
		response.setContentType("application/pdf");  
        response.setCharacterEncoding("utf-8");  
        //这里对文件名进行编码，保证下载时汉字显示正常  
        String fileName = "invoice.pdf";  
        //Content-disposition属性设置成以附件方式进行下载  
        response.setHeader("Content-disposition", "attachment;filename="  
                + fileName);  
        OutputStream os = response.getOutputStream();
        PdfWriter.getInstance(document,os);
        //workbook.write(os);  
        os.flush();  
        os.close();  
        //workbook.close();
		
	}

	
}

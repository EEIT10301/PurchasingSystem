package Account.view;

import java.io.OutputStream;   
import java.util.List;  
import java.util.Map;  
  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;  
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import Account.model.Accout_PayableBean;  
  

public class ExcelViewForInvoice extends AbstractXlsxView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		  @SuppressWarnings("unchecked")
		List<Accout_PayableBean> list = (List<Accout_PayableBean>) model.get("infoList");  
	        if (list != null && list.size() != 0) {  
	            int len = list.size();  
	            Sheet sheet = workbook.createSheet();  
	            //設定日期格式
	            CellStyle cellStyle = workbook.createCellStyle();
	    	    CreationHelper createHelper = workbook.getCreationHelper();
	    	    short dateFormat = createHelper.createDataFormat().getFormat("yyyy/MM/dd");
	    	    cellStyle.setDataFormat(dateFormat);
	            // 第一行文字说明  
	            Row row = sheet.createRow(0);  
	            Cell cell=row.createCell(0,CellType.STRING);
	            cell.setCellValue("廠商帳款單號");
	            cell = row.createCell(1, CellType.STRING); 
	            cell.setCellValue("請款單單號");  
	            cell = row.createCell(2, CellType.STRING); 
	            cell.setCellValue("廠商名稱");  
	            cell = row.createCell(3, CellType.STRING);  
	            cell.setCellValue("廠商結帳週期");  
	            cell = row.createCell(4, CellType.STRING);  
	            cell.setCellValue("應付款項金額");  
	            cell = row.createCell(5, CellType.STRING);  
	            cell.setCellValue("產生日期");  
	            cell = row.createCell(6, CellType.STRING); 
	            cell.setCellValue("支票號碼");  
	            cell = row.createCell(7, CellType.STRING);  
	            cell.setCellValue("匯款帳號");  
	            cell = row.createCell(8, CellType.STRING);  
	            cell.setCellValue("預計付款日");  
	            cell = row.createCell(9, CellType.STRING);  
	            cell.setCellValue("付款狀況");  
	            cell = row.createCell(10, CellType.STRING);  
	            cell.setCellValue("實付金額");  
	  
	            //下面是具体内容  
	            for (int i = 0; i < len; i++) {  
	                row = sheet.createRow(i + 1);  
	                cell = row.createCell(0, CellType.STRING);  
	                cell.setCellValue(list.get(i).getAccoutpayable_no()); 
	                sheet.autoSizeColumn(0);
	                cell = row.createCell(1, CellType.STRING);
	                cell.setCellValue(list.get(i).getInv_id());
	                sheet.autoSizeColumn(1);
	                cell = row.createCell(2, CellType.STRING); 
	                cell.setCellValue(list.get(i).getpO_Vendor_InfoBean().getVendor_name());  
	                sheet.autoSizeColumn(2);
	                cell = row.createCell(3, CellType.STRING);  
	                cell.setCellValue(list.get(i).getpO_Vendor_InfoBean().getPayment_term());  
	                sheet.autoSizeColumn(3);
	                cell = row.createCell(4, CellType.STRING); 
	                cell.setCellValue(list.get(i).getAmount_Payable());  
	                sheet.autoSizeColumn(4);
	                cell = row.createCell(5);  
	                cell.setCellValue(list.get(i).getBooking_Date());  
	                cell.setCellStyle(cellStyle);
	                sheet.autoSizeColumn(5);
	                cell = row.createCell(6, CellType.STRING);  
	                cell.setCellValue(list.get(i).getCheque_no());
	                sheet.autoSizeColumn(6);
	                cell = row.createCell(7, CellType.STRING); 
	                cell.setCellValue(list.get(i).getpO_Vendor_InfoBean().getVendor_acc());  
	                sheet.autoSizeColumn(7);
	                cell = row.createCell(8); 
	                cell.setCellValue(list.get(i).getExcept_Payment_Date());  
	                cell.setCellStyle(cellStyle);
	                sheet.autoSizeColumn(8);
	                cell = row.createCell(9, CellType.STRING);  
	                cell.setCellValue(list.get(i).getPayable_Status()); 
	                sheet.autoSizeColumn(9);	
	                cell = row.createCell(10, CellType.STRING);  
	                cell.setCellValue(list.get(i).getAmount_Paid());  
	                sheet.autoSizeColumn(10);
	            }  
	        }  
	  
	        response.setContentType("application/vnd.ms-excel");  
	        response.setCharacterEncoding("utf-8");  
	        //这里对文件名进行编码，保证下载时汉字显示正常  
	        String fileName = "invoice.xlsx";  
	        //Content-disposition属性设置成以附件方式进行下载  
	        response.setHeader("Content-disposition", "attachment;filename="  
	                + fileName);  
	        OutputStream os = response.getOutputStream();  
	        workbook.write(os);  
	        os.flush();  
	        os.close();  
	        workbook.close();
	}

	


	


	}  
		
	
	
	



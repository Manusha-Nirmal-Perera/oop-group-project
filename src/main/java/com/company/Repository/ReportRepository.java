package com.company.Repository;

import java.util.List;

import com.company.modal.Report;

public interface ReportRepository {
	List<Report> getAllReports();
    List<Report> getAllReportsByUid(int uid);
    boolean addReport(Report report);
    boolean resolveReport(int rid);
    boolean deleteReport(int rid);
    int getReportCount();
}

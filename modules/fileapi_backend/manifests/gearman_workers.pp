class fileapi_backend::gearman_workers {
    include supervisor

    fileapi_backend::executable_file { '/home/fileapi/project/api/current/bin/workers/start-one': }
    fileapi_backend::executable_file { '/home/fileapi/project/api/current/bin/workers/stop-all': }

    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersResizeImageDimensionsWorker': }
    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersConvertGifToVideoWorker': }
    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersConvertVideoWorker': }
    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersReduceImageFileSizeWorker': }
    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersConvertImageWorker': }
    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersVirusScanWorker': }
    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersConvertTtfFontWorker': }
    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersScreenshotWebPageWorker': }
    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersWatermarkImageWorker': }
    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersPgnParserWorker': }
    fileapi_backend::gearman_worker { 'FileApiWorkerBundleWorkersDetectPornWorker': }
}

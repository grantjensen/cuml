/*
 * Copyright (c) 2018-2022, NVIDIA CORPORATION.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "ols.cuh"
#include "qn/qn.cuh"
#include "ridge.cuh"
#include <cuml/linear_model/glm.hpp>

namespace raft {
class handle_t;
}

namespace ML {
namespace GLM {

using namespace MLCommon;

void olsFit(const raft::handle_t& handle,
            float* input,
            int n_rows,
            int n_cols,
            float* labels,
            float* coef,
            float* intercept,
            bool fit_intercept,
            bool normalize,
            int algo)
{
  olsFit(handle,
         input,
         n_rows,
         n_cols,
         labels,
         coef,
         intercept,
         fit_intercept,
         normalize,
         handle.get_stream(),
         algo);
}

void olsFit(const raft::handle_t& handle,
            double* input,
            int n_rows,
            int n_cols,
            double* labels,
            double* coef,
            double* intercept,
            bool fit_intercept,
            bool normalize,
            int algo)
{
  olsFit(handle,
         input,
         n_rows,
         n_cols,
         labels,
         coef,
         intercept,
         fit_intercept,
         normalize,
         handle.get_stream(),
         algo);
}

void gemmPredict(const raft::handle_t& handle,
                 const float* input,
                 int n_rows,
                 int n_cols,
                 const float* coef,
                 float intercept,
                 float* preds)
{
  gemmPredict(handle, input, n_rows, n_cols, coef, intercept, preds, handle.get_stream());
}

void gemmPredict(const raft::handle_t& handle,
                 const double* input,
                 int n_rows,
                 int n_cols,
                 const double* coef,
                 double intercept,
                 double* preds)
{
  gemmPredict(handle, input, n_rows, n_cols, coef, intercept, preds, handle.get_stream());
}

void ridgeFit(const raft::handle_t& handle,
              float* input,
              int n_rows,
              int n_cols,
              float* labels,
              float* alpha,
              int n_alpha,
              float* coef,
              float* intercept,
              bool fit_intercept,
              bool normalize,
              int algo)
{
  ridgeFit(handle,
           input,
           n_rows,
           n_cols,
           labels,
           alpha,
           n_alpha,
           coef,
           intercept,
           fit_intercept,
           normalize,
           handle.get_stream(),
           algo);
}

void ridgeFit(const raft::handle_t& handle,
              double* input,
              int n_rows,
              int n_cols,
              double* labels,
              double* alpha,
              int n_alpha,
              double* coef,
              double* intercept,
              bool fit_intercept,
              bool normalize,
              int algo)
{
  ridgeFit(handle,
           input,
           n_rows,
           n_cols,
           labels,
           alpha,
           n_alpha,
           coef,
           intercept,
           fit_intercept,
           normalize,
           handle.get_stream(),
           algo);
}

void qnFit(const raft::handle_t& cuml_handle,
           float* X,
           bool X_col_major,
           float* y,
           int N,
           int D,
           int C,
           bool fit_intercept,
           float l1,
           float l2,
           int max_iter,
           float grad_tol,
           float change_tol,
           int linesearch_max_iter,
           int lbfgs_memory,
           int verbosity,
           float* w0,
           float* f,
           int* num_iters,
           int loss_type,
           float* sample_weight)
{
  qnFit(cuml_handle,
        X,
        X_col_major,
        y,
        N,
        D,
        C,
        fit_intercept,
        l1,
        l2,
        max_iter,
        grad_tol,
        change_tol,
        linesearch_max_iter,
        lbfgs_memory,
        verbosity,
        w0,
        f,
        num_iters,
        (QN_LOSS_TYPE)loss_type,
        cuml_handle.get_stream(),
        sample_weight);
}

void qnFit(const raft::handle_t& cuml_handle,
           double* X,
           bool X_col_major,
           double* y,
           int N,
           int D,
           int C,
           bool fit_intercept,
           double l1,
           double l2,
           int max_iter,
           double grad_tol,
           double change_tol,
           int linesearch_max_iter,
           int lbfgs_memory,
           int verbosity,
           double* w0,
           double* f,
           int* num_iters,
           int loss_type,
           double* sample_weight)
{
  qnFit(cuml_handle,
        X,
        X_col_major,
        y,
        N,
        D,
        C,
        fit_intercept,
        l1,
        l2,
        max_iter,
        grad_tol,
        change_tol,
        linesearch_max_iter,
        lbfgs_memory,
        verbosity,
        w0,
        f,
        num_iters,
        (QN_LOSS_TYPE)loss_type,
        cuml_handle.get_stream(),
        sample_weight);
}

void qnFitSparse(const raft::handle_t& cuml_handle,
                 float* X_values,
                 int* X_cols,
                 int* X_row_ids,
                 int X_nnz,
                 float* y,
                 int N,
                 int D,
                 int C,
                 bool fit_intercept,
                 float l1,
                 float l2,
                 int max_iter,
                 float grad_tol,
                 float change_tol,
                 int linesearch_max_iter,
                 int lbfgs_memory,
                 int verbosity,
                 float* w0,
                 float* f,
                 int* num_iters,
                 int loss_type,
                 float* sample_weight)
{
  qnFitSparse(cuml_handle,
              X_values,
              X_cols,
              X_row_ids,
              X_nnz,
              y,
              N,
              D,
              C,
              fit_intercept,
              l1,
              l2,
              max_iter,
              grad_tol,
              change_tol,
              linesearch_max_iter,
              lbfgs_memory,
              verbosity,
              w0,
              f,
              num_iters,
              (QN_LOSS_TYPE)loss_type,
              cuml_handle.get_stream(),
              sample_weight);
}

void qnFitSparse(const raft::handle_t& cuml_handle,
                 double* X_values,
                 int* X_cols,
                 int* X_row_ids,
                 int X_nnz,
                 double* y,
                 int N,
                 int D,
                 int C,
                 bool fit_intercept,
                 double l1,
                 double l2,
                 int max_iter,
                 double grad_tol,
                 double change_tol,
                 int linesearch_max_iter,
                 int lbfgs_memory,
                 int verbosity,
                 double* w0,
                 double* f,
                 int* num_iters,
                 int loss_type,
                 double* sample_weight)
{
  qnFitSparse(cuml_handle,
              X_values,
              X_cols,
              X_row_ids,
              X_nnz,
              y,
              N,
              D,
              C,
              fit_intercept,
              l1,
              l2,
              max_iter,
              grad_tol,
              change_tol,
              linesearch_max_iter,
              lbfgs_memory,
              verbosity,
              w0,
              f,
              num_iters,
              (QN_LOSS_TYPE)loss_type,
              cuml_handle.get_stream(),
              sample_weight);
}

void qnDecisionFunction(const raft::handle_t& cuml_handle,
                        float* X,
                        bool X_col_major,
                        int N,
                        int D,
                        int C,
                        bool fit_intercept,
                        float* params,
                        int loss_type,
                        float* preds)
{
  qnDecisionFunction(cuml_handle,
                     X,
                     X_col_major,
                     N,
                     D,
                     C,
                     fit_intercept,
                     params,
                     (QN_LOSS_TYPE)loss_type,
                     preds,
                     cuml_handle.get_stream());
}

void qnDecisionFunction(const raft::handle_t& cuml_handle,
                        double* X,
                        bool X_col_major,
                        int N,
                        int D,
                        int C,
                        bool fit_intercept,
                        double* params,
                        int loss_type,
                        double* scores)
{
  qnDecisionFunction(cuml_handle,
                     X,
                     X_col_major,
                     N,
                     D,
                     C,
                     fit_intercept,
                     params,
                     (QN_LOSS_TYPE)loss_type,
                     scores,
                     cuml_handle.get_stream());
}

void qnDecisionFunctionSparse(const raft::handle_t& cuml_handle,
                              float* X_values,
                              int* X_cols,
                              int* X_row_ids,
                              int X_nnz,
                              int N,
                              int D,
                              int C,
                              bool fit_intercept,
                              float* params,
                              int loss_type,
                              float* scores)
{
  qnDecisionFunctionSparse(cuml_handle,
                           X_values,
                           X_cols,
                           X_row_ids,
                           X_nnz,
                           N,
                           D,
                           C,
                           fit_intercept,
                           params,
                           (QN_LOSS_TYPE)loss_type,
                           scores,
                           cuml_handle.get_stream());
}

void qnDecisionFunctionSparse(const raft::handle_t& cuml_handle,
                              double* X_values,
                              int* X_cols,
                              int* X_row_ids,
                              int X_nnz,
                              int N,
                              int D,
                              int C,
                              bool fit_intercept,
                              double* params,
                              int loss_type,
                              double* scores)
{
  qnDecisionFunctionSparse(cuml_handle,
                           X_values,
                           X_cols,
                           X_row_ids,
                           X_nnz,
                           N,
                           D,
                           C,
                           fit_intercept,
                           params,
                           (QN_LOSS_TYPE)loss_type,
                           scores,
                           cuml_handle.get_stream());
}

void qnPredict(const raft::handle_t& cuml_handle,
               float* X,
               bool X_col_major,
               int N,
               int D,
               int C,
               bool fit_intercept,
               float* params,
               int loss_type,
               float* scores)
{
  qnPredict(cuml_handle,
            X,
            X_col_major,
            N,
            D,
            C,
            fit_intercept,
            params,
            (QN_LOSS_TYPE)loss_type,
            scores,
            cuml_handle.get_stream());
}

void qnPredict(const raft::handle_t& cuml_handle,
               double* X,
               bool X_col_major,
               int N,
               int D,
               int C,
               bool fit_intercept,
               double* params,
               int loss_type,
               double* preds)
{
  qnPredict(cuml_handle,
            X,
            X_col_major,
            N,
            D,
            C,
            fit_intercept,
            params,
            (QN_LOSS_TYPE)loss_type,
            preds,
            cuml_handle.get_stream());
}

void qnPredictSparse(const raft::handle_t& cuml_handle,
                     float* X_values,
                     int* X_cols,
                     int* X_row_ids,
                     int X_nnz,
                     int N,
                     int D,
                     int C,
                     bool fit_intercept,
                     float* params,
                     int loss_type,
                     float* preds)
{
  qnPredictSparse(cuml_handle,
                  X_values,
                  X_cols,
                  X_row_ids,
                  X_nnz,
                  N,
                  D,
                  C,
                  fit_intercept,
                  params,
                  (QN_LOSS_TYPE)loss_type,
                  preds,
                  cuml_handle.get_stream());
}

void qnPredictSparse(const raft::handle_t& cuml_handle,
                     double* X_values,
                     int* X_cols,
                     int* X_row_ids,
                     int X_nnz,
                     int N,
                     int D,
                     int C,
                     bool fit_intercept,
                     double* params,
                     int loss_type,
                     double* preds)
{
  qnPredictSparse(cuml_handle,
                  X_values,
                  X_cols,
                  X_row_ids,
                  X_nnz,
                  N,
                  D,
                  C,
                  fit_intercept,
                  params,
                  (QN_LOSS_TYPE)loss_type,
                  preds,
                  cuml_handle.get_stream());
}

}  // namespace GLM
}  // namespace ML
